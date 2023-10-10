from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import markdown

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
def show_resume():
    with open("RESUME.md", "r") as f:
        markdown_string = f.read()

    html_string = markdown.markdown(markdown_string)
    return html_string
