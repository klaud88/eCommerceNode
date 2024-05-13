import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

interface newUser {
  username: string;
  upassword: string;
  email: string;
  created_at: Date;
  groups?: string;
}

interface check {
  username: string;
  upassword: string;
}

const options = {
  timeZone: "Asia/Tbilisi",
};

const prisma = new PrismaClient();
const validation = ({ username, upassword, email }: newUser) => {
  if (!username || username.length <= 2) {
    return false;
  }

  if (!upassword || upassword.length <= 4) {
    return false;
  }

  if (!email || !email.includes("@")) {
    return false;
  }

  return true;
};

const creatUser = async ({ username, upassword, email, groups }: newUser) => {
  const created_at = new Date(Date.now());
  const validate = validation({
    username,
    upassword,
    email,
    created_at,
    groups,
  });

  if (!validate) {
    return {
      success: false,
      message: "Invalid Data",
    };
  }
  const saltRound = 10;
  const salt = await bcrypt.genSaltSync(saltRound);
  const hashUpassword = await bcrypt.hashSync(upassword, salt);
  const response = await prisma.users.create({
    data: {
      username,
      upassword: hashUpassword,
      email,
      created_at,
      //@ts-ignore
      groups,
    },
  });

  return {
    success: true,
    massage: "You have registred successfully",
  };
};

const userNameCheck = async (usernames: string) => {
  if (!usernames) {
    return {
      sucssecc: false,
      massage: "Enter Username",
    };
  }
  const userName = await prisma.users.findFirst({
    where: {
      username: usernames as string,
    },
  });
  if (userName) {
    return {
      sucssecc: false,
      massage: "Username Already Exists",
    };
  }
  return {
    sucssecc: true,
    massage: "Username Approved",
  };
};

const loginCheck = async ({ username, upassword }: check) => {
  if (!username || !upassword) {
    return {
      sucssecc: false,
      massage: "User or Password Incorect",
    };
  }
  const user = await prisma.users.findFirst({
    where: {
      username: username,
    },
  });

  if (!user) {
    return {
      sucssecc: false,
      massage: "Username Is Incorrect",
    };
  }
  const upasswordCheck = await bcrypt.compareSync(upassword, user.upassword);

  if (!upasswordCheck) {
    return {
      sucssecc: false,
      massage: "Incorect Password",
    };
  }
  return {
    sucssecc: true,
    //@ts-ignore
    token: jwt.sign({ name: user.username }, process.env.TOKEN_SECRET, {
      expiresIn: "1800s",
    }),
    userId: user.id,
  };
};

export { creatUser, newUser, loginCheck, userNameCheck };
