import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

const authenCheck = (req: Request, res: Response, next: NextFunction) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  if (token == null) {
    return res.send("401");
  }
  //@ts-ignore
  jwt.verify(token, process.env.TOKEN_SECRET, (err: any) => {
    if (err) {
      return res.send("403").json("Pleath Login First");
    }
    next();
  });
};

export { authenCheck };
