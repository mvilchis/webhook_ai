from flask import request, url_for
from flask_api import FlaskAPI, status, exceptions
from utils import *
import os
import ast
from flask import jsonify
app = FlaskAPI(__name__)

@app.route("/", methods=['GET', 'POST'])
def get_class():
    """
    List or create notes.
    """
    if request.method == 'GET':
        descripcion = str(request.args.get('descripcion'))
        importancia = str(request.args.get('importancia')) 
        return jsonify({"class": "1", "get": descripcion})
      

if __name__ == "__main__":
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.run(debug=True,host="0.0.0.0", port= int(os.getenv('WEBHOOK_PORT', 5000)))
