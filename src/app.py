import os
from flask import Flask, render_template_string

app = Flask(__name__)

@app.route("/")
def greet():
    name = os.getenv("NAME", "Guest")  # Fallback to 'Guest' if not set
    html_template = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Greetings</title>
        <link 
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
            rel="stylesheet"
        >
        <style>
            body {
                background: linear-gradient(to right, #74ebd5, #acb6e5);
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .greeting-card {
                background-color: white;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 8px 16px rgba(0,0,0,0.2);
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="greeting-card">
            <h1 class="display-4">Hello, {{ name }}!</h1>
            <p class="lead">Welcome to a senseless application hosted on an AKS.</p>
        </div>
    </body>
    </html>
    """
    return render_template_string(html_template, name=name)

if __name__ == "__main__":
    app.run(debug=True)
