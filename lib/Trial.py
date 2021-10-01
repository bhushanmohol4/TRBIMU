from flask import Flask, app, json, jsonify, request

app = Flask(__name__)

@app.route('/api',methods=['GET'])
def Velocity():
    d = {}
    d['Accx'] = str(request.args['ax'])
    

    return jsonify(d)


if __name__ == '__main__':
    app.run()