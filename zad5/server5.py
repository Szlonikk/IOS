from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from jose import jwt
from datetime import datetime, timedelta

app = FastAPI()

SECRET = "SECRET"
ALGO = "HS256"

USERS = {
    "bed": "1234",
    "jakub": "pass"
}

class LoginReq(BaseModel):
    username: str
    password: str

class LoginRes(BaseModel):
    access_token: str
    token_type: str = "bearer"
    expires_in: int

def create_token(username: str, minutes: int = 60) -> str:
    exp = datetime.utcnow() + timedelta(minutes=minutes)
    payload = {"sub": username, "exp": exp}
    return jwt.encode(payload, SECRET, algorithm=ALGO)

@app.post("/login", response_model=LoginRes)
def login(req: LoginReq):
    pwd = USERS.get(req.username.lower())
    if not pwd or pwd != req.password:
        raise HTTPException(status_code=401, detail="Invalid credentials")

    token = create_token(req.username.lower(), minutes=60)
    return LoginRes(access_token=token, expires_in=60 * 60)

@app.get("/me")
def me(authorization: str = ""):
    if not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="Missing token")

    token = authorization.removeprefix("Bearer ").strip()
    try:
        payload = jwt.decode(token, SECRET, algorithms=[ALGO])
        return {"username": payload["sub"]}
    except Exception:
        raise HTTPException(status_code=401, detail="Invalid token")
