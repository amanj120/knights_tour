from flask import Flask, render_template, request
app = Flask(__name__)#, template_folder=frontend, static_folder=frontend)

@app.route('/')
def home():
	return (open("knights_pretty.html").read())

if __name__ == '__main__':
	app.run(debug=True)