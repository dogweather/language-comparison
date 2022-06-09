# main.py
import text_service

from fastapi import FastAPI
from pydantic import BaseModel


class StatuteBody(BaseModel):
    text: str


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/add_typography/{text}")
async def add_typography(text: str):
    return {"result": text_service.add_typography(text)}


@app.post("/add_pinpoint_ids/")
async def add_pinpoint_ids(body: StatuteBody) -> StatuteBody:
    return StatuteBody(text=text_service.add_pinpoint_ids(body.text))
