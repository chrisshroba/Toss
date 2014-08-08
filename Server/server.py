from flask import *


app = Flask(__name__)

@app.route("/api/image", methods=["GET", "POST"])
def image_route():
    if request.method == "GET":
        return get_image()
    elif request.method == "POST":
        return post_image()


def get_image():
    return


def post_image():
    computer_id = request.form.get("computer_id")
    image_data = request.form.get("image_data")
