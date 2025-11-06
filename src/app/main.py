from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title='Python Mastery Roadmap Sample')

class Item(BaseModel):
    name: str
    value: int

@app.get('/')
def root():
    return {'message': 'Hello from Python Mastery Roadmap'}

@app.post('/items')
def create_item(item: Item):
    return {'item': item}
