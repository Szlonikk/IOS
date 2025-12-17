from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/shopping")
def shopping():
    return {
        "categories": [
            {
                "name": "Fruits",
                "products": [
                    {"name": "Banana", "quantity": 6, "isBought": False},
                    {"name": "Apple", "quantity": 3, "isBought": True}
                ]
            },
            {
                "name": "Dairy",
                "products": [
                    {"name": "Milk", "quantity": 1, "isBought": False}
                ]
            }
        ]
    }
