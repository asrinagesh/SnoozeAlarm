
from flask import Flask, request, jsonify
import braintree

def getMerchantId():
    return ""

def getPublicKey():
    return ""

def getPrivateKey():
    return ""

braintree.Configuration.configure(  braintree.Environment.Sandbox,
                                    merchant_id=getMerchantId(),
                                    public_key=getPublicKey(),
                                    private_key=getPrivateKey())

app = Flask(__name__)

@app.route('/client_token', methods=['GET'])
def client_token():
    print 'client_token'
    return braintree.ClientToken.generate()

@app.route('/add_user', methods=['POST'])
def add_user():
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    payment_method_nonce = request.form["payment_method_nonce"]

    print 'adding new user', first_name, last_name
    print 'nonce', payment_method_nonce

    result = braintree.Customer.create({
        "first_name": first_name,
        "last_name": last_name,
        "payment_method_nonce": payment_method_nonce
        })

    if result.is_success:
        print 'success', result.customer.id
    else:
        print 'error:', result.message
        return jsonify(result=str(-1))

    return jsonify(result=str(result.customer.id))#result.customer.id)

@app.route('/charge', methods=['POST'])
def charge():
    try:
        user_id = request.form["user_id"]
        amount = request.form["amount"]
    except KeyError:
        print 'incorrect post data!'
        return jsonify(str(-3))

    print 'finding customer'

    try:
        customer = braintree.Customer.find(user_id)
    except braintree.exceptions.not_found_error.NotFoundError:
        print 'could not find:', user_id
        return jsonify(str(-1))
        
    print 'getting payment method'
    payment_method = customer.payment_methods[0]

    print 'transacting!'
    result = braintree.Transaction.sale({
        "amount": str(amount),
        "payment_method_token": payment_method.token,
        "options": {
            "submit_for_settlement": True
        }
    })

    print 'post checks'

    if not result.is_success:
        print 'error transacting!'
        print result.message
        return jsonify(str(-2))
    else:
        return jsonify(str(0))

app.run(host='0.0.0.0')

print 'done'