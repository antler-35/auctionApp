import os
from flask import Flask, send_from_directory, request, redirect
import api as api
from api import attributes
from dotenv import load_dotenv
from api.signup import signup
from api.login import login
from api.auctions import besthouses


load_dotenv()
app = Flask(__name__, static_url_path='')


@app.route('/api/login', methods=['POST'])
def api_login():
    '''Allow user to login in app

    Params:
        user_password: str (required)
        user_name: str (required)
    '''
    data = request.get_json()
    return login(**data)


@app.route('/api/userData', methods=['POST'])
def api_user_data():
    data = request.get_json()
    return api.user_data(**data)


@app.route('/api/signup', methods=['POST'])
def api_signup():
    '''Allow user to create a new account

    Params:
        user_password: str (required)
        user_name: str (required)
        user_phone: str (required)
        user_address: str (required)
    '''
    data = request.get_json()
    return signup(
        data.get('user_password'),
        data.get('user_name'),
        data.get('user_phone'),
        data.get('user_address'),
    )


@app.route('/api/category', methods=['POST'])
def category_data():
    return api.getCategory(
        request.get_json()["userId"],
        request.get_json()["email"]
    )


@app.route('/api/offers', methods=['POST'])
def Offers():
    data = request.get_json()
    return api.offers(**data)


@app.route('/api/auction_house', methods=['POST'])
def auction_house():
    data = request.get_json()
    return attributes.auctionHouse(**data)


@app.route('/api/auction_house_transaction', methods=['POST'])
def auctionHouse():
    data = request.get_json()
    return attributes.auctionHousetranscation(**data)


@app.route('/api/facilitates', methods=['POST'])
def Facilitates():
    data = request.get_json()
    return attributes.facilities(**data)


@app.route('/api/app_user', methods=['POST'])
def AppUser():
    data = request.get_json()
    return attributes.appUser(**data)


@app.route('/api/buyer', methods=['POST'])
def Buyer():
    data = request.get_json()
    return attributes.buyer(**data)


@app.route('/api/seller', methods=['POST'])
def Seller():
    data = request.get_json()
    return attributes.seller(**data)


@app.route('/api/invokes_tx', methods=['POST'])
def InvokesTx():
    data = request.get_json()
    return attributes.invokesTx(**data)


@app.route('/api/product_listed_by_seller', methods=['POST'])
def ListSeller():
    data = request.get_json()
    return attributes.productListedBySeller(**data)


@app.route('/api/bid_regarding_product', methods=['POST'])
def bidRegarding():
    data = request.get_json()
    return attributes.BidRegardingProduct(**data)


@app.route('/api/manages_bid', methods=['POST'])
def manageBid():
    data = request.get_json()
    return attributes.ManageBid(**data)


@app.route('/css/<path>')
def send_static_css_files(path):
    return send_from_directory('public/css', path)


@app.route('/scripts/<path>')
def send_static_script_files(path):
    return send_from_directory('public/scripts', path)


@app.route('/')
def index():
    return redirect(f'{request.base_url}index.html')


@app.route('/<path>')
def send_static_files(path):
    return send_from_directory('public', path)


@app.route('/api/place_bid', methods=['POST'])
def api_new_bid():
    '''Create a new bid

    Params:
        user_id: str (required)
        price: str (required)
        bid_id: str (required)

    '''
    data = request.get_json()
    return attributes.new_bid(**data)


@app.route('/api/besthouses', methods=['POST'])
def api_besthouses():
    return besthouses(items=request.get_json()["items"])


@app.route('/api/topbuyer', methods=['POST'])
def api_topbuyer():
    return attributes.topbuyer(items=request.get_json()["items"])


@app.route('/api/topseller', methods=['POST'])
def api_topseller():
    return attributes.topseller(items=request.get_json()["items"])


@app.route('/api/user_like_a_product', methods=['POST'])
def api_user_like_product():
    return api.userData.user_like_product(
        request.get_json()["user_id"],
        request.get_json()["product_id"]
    )


@app.route('/api/user_dislike_a_product', methods=['POST'])
def api_user_dislike_product():
    return api.userData.user_dislike_product(
        request.get_json()["user_id"],
        request.get_json()["product_id"]
    )


@app.route('/api/user_like_list', methods=['POST'])
def api_user_like_list():
    return api.userData.user_like_list(
        request.get_json()["user_id"]
    )


@app.route('/api/product_like_by_userlist', methods=['POST'])
def api_product_like_by_userlist():
    return api.userData.product_like_by_userlist(
        request.get_json()["product_id"]
    )


@app.route("/api/create_new_product", methods=["POST"])
def createNewProduct():
    data = request.get_json()
    return attributes.createNewProducts(**data)


@app.route('/api/topbuyer_by_product', methods=['POST'])
def api_topbuyerbyproduct():
    return attributes.topbuyerbyproduct(
        product_id=request.get_json()["product_id"],
        items=request.get_json()["items"]
    )


@app.route("/api/auction_data", methods=["POST"])
def productData():
    """return who had bidded to the specific product"""
    data = request.get_json()
    return attributes.productsData(**data)


@app.route("/api/get_past_bids", methods=["POST"])
def get_past_bids():
    """return pasts bids of the logged user."""
    data = request.get_json()
    return attributes.past_bids(**data)


if __name__ == "__main__":
    app.run(debug=True or os.environ.get("DEBUG"))
