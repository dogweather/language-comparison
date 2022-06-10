# main.py
from text_service import StatuteBody, add_pinpoint_ids, add_typography
import text_service

from fastapi import FastAPI


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/typography/{text}")
async def typography(text: str):
    return {"result": text_service.add_typography(text)}


@app.post("/pinpoint_ids/", response_model=StatuteBody)
async def pinpoint_ids(body: StatuteBody):
    return text_service.add_pinpoint_ids(body)
