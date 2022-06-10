from fastapi import FastAPI
from text_service import StatuteBody, add_pinpoint_ids, add_typography


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/typography/{text}")
async def typography(text: str):
    return {"result": add_typography(text)}


@app.post("/pinpoint_ids/", response_model=StatuteBody)
async def pinpoint_ids(body: StatuteBody):
    return add_pinpoint_ids(body)
