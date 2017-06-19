from flask import request, url_for
from flask_api import FlaskAPI, status, exceptions
from utils import *
import os
import ast
from flask import jsonify
app = FlaskAPI(__name__)

@app.route("/<variable_name>", methods=['GET', 'POST'])
def get_nearest_bansefi(variable_name = "fecha"):
    """
    List or create notes.
    """
    if request.method == 'POST':
        request_dic = request.form.to_dict()
        #Obtain values list of rapidpro post
        values_dic = request_dic['values']
        #Response of rapidpro is a dictionary, but parse to dict is a problem
        #because contains quotes, so, we search by indexof variable_name
        to_parse= values_dic[:values_dic.rfind(variable_name)].split("text")[-1]
        to_parse = to_parse.split(":")[1]
        to_parse = to_parse.split(",")[0]
        to_parse = re.sub(r'"','',to_parse).strip()
        ################ CALL OF UTIL FUNCTION ################
        #response_value= call_function(to_parse)


        return jsonify({variable_name:response_value})

if __name__ == "__main__":
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.run(debug=True,host="0.0.0.0", port= int(os.getenv('WEBHOOK_PORT', 5000)))
