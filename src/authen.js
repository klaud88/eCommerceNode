import bcrypt from "bcrypt";

const saltRounds = 10;

const salt = await bcrypt.genSaltSync(saltRounds);
const hashPassword = await bcrypt.hashSync(upassword, salt);
