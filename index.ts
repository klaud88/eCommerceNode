import express, { Request, Response, Application, NextFunction } from "express";
import { creatUser, loginCheck, userNameCheck } from "./src/registration";
import dotenv from "dotenv";
import { PrismaClient } from "@prisma/client";
import bodyParser, { json } from "body-parser";
import {
  creatProduct,
  items,
  myCart,
  addToCart,
  removeProduct,
  editProduct,
  removeFromCart,
} from "./src/items";
import cors from "cors";
import { authenCheck } from "./src/authcheck";
import { stringify } from "querystring";

dotenv.config();

const prisma = new PrismaClient();

const app: Application = express();
const port = process.env.PORT || 8000;

app.use(bodyParser.json());

app.use(
  cors({
    origin: "http://localhost:5173",
    methods: ["GET", "POST"],
  })
);

app.post("/registration", async (req: Request, res: Response) => {
  try {
    const { username, upassword, email, created_at, groups } = req.body;

    const response = await creatUser({
      username: username,
      upassword: upassword,
      email: email,
      created_at: created_at,
      groups: groups,
    });
    const code = response.success ? 200 : 500;
    res.status(code).json(response);
  } catch (error) {
    console.log(error);
    res.json(error);
  }
});

app.post("/login", async (req: Request, res: Response) => {
  try {
    const { username, upassword } = req.body;
    if (!username || username.length < 3) {
      return res.json("Please Type USERNAME !");
    }
    if (!upassword) {
      return res.status(400).json("Please Enter PASSWORD !");
    }
    const user = await loginCheck({
      username: username,
      upassword: upassword,
    });
    res.json(user);
  } catch (error) {
    res.json(error);
  }
});

app.post("/usernameCheck", async (req: Request, res: Response) => {
  const { username } = req.body;
  console.log(username);
  try {
    if (!username) {
      res.status(500).json("Enter Username");
    }
    const userCkeck = await userNameCheck(username as string);
    res.status(200).json(userCkeck);
    // console.log(userCkeck);
  } catch (message) {
    res.status(500).json(message);
  }
});

app.post(
  "/authenCheck",

  (req: Request, res: Response, next: NextFunction) => {
    const check = authenCheck;
    if (!check) {
      console.log("NO ERROR");
    }
    console.log("sucsscful");
    next();
  }
);

app.get(
  "/shop",
  authenCheck,

  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const products = await items();
      if (!products) {
        res.status(500).json("No Data");
      }
      res.json(products);
    } catch (error) {
      res.send(error);
    }
    next();
  }
);

app.post(
  "/addProduct",
  authenCheck,

  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { id, image, title, description, price, created_at } = req.body;

      const response = await creatProduct({
        id: id,
        image: image,
        title: title,
        description: description,
        price: price,
        created_at: created_at,
      });
      const code = response.success ? 200 : 500;
      res.status(code).json(response);
    } catch (message) {
      res.json(message);
    }
    next();
  }
);

app.post(
  "/removeProduct",
  authenCheck,
  async (req: Request, res: Response, next: NextFunction) => {
    const { id } = req.body;
    try {
      const response = await removeProduct({
        id: id,
      });
      res.json(response);
    } catch (erro) {
      res.json(erro);
    }
    next();
  }
);

app.post(
  "/editProduct",
  authenCheck,
  async (req: Request, res: Response, next: NextFunction) => {
    const { id, image, title, description, price, created_at } = req.body;
    try {
      const response = await editProduct({
        id,
        image,
        title,
        description,
        price,
        created_at,
      });
      res.json(response);
    } catch (error) {
      res.json(error);
    }
    next();
  }
);

app.get(
  "/usersCart",
  authenCheck,
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const userID = parseInt(req.query.userID as string, 10);
      const cart: any = await myCart(userID);
      if (!cart) {
        res.status(500).json("Cart Is Empty");
      } else {
        const itemIds = cart.map((item: any) => item.itemID);
        const userCart = await prisma.items.findMany({
          where: {
            id: {
              in: itemIds,
            },
          },
        });
        res.status(200).json(userCart);
      }
    } catch (error) {
      res.json(error);
    }
    next();
  }
);

app.post(
  "/addCart",
  authenCheck,
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { userID, itemID } = req.body;
      const response = await addToCart({
        userID: userID,
        itemID: itemID,
      });

      res.status(200).json(response);
    } catch (message) {
      res.status(500).json(message);
    }
    next();
  }
);

app.post(
  "/removeFromCart",
  authenCheck,
  async (req: Request, res: Response, next: NextFunction) => {
    const { userID, itemID } = req.body;
    const validate = { userID, itemID };
    try {
      if (!validate) {
        res.status(500).json("NO IDs!");
      } else {
        const response = await removeFromCart(userID, itemID);
        res.status(200).json(response);
      }
    } catch (message) {
      res.status(500).json(message);
    }
    next();
  }
);

app.listen(port, () => {});
