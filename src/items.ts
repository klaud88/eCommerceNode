import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

interface productType {
  id: number;
  image: string;
  title: string;
  description: string;
  price: number;
  created_at: any;
}

interface cart {
  userID: number;
  itemID: number;
}
const items = async () => {
  try {
    const items = await prisma.items.findMany();
    if (!items) {
      return null;
    }
    return items;
  } catch (error) {
    return error;
  }
};

const creatProduct = async ({
  image,
  title,
  description,
  price,
}: productType) => {
  const created_at = new Date(Date.now());
  const validate = { image, title, description, price, created_at };

  if (!validate) {
    return {
      success: false,
      message: "Pleas fill all form",
    };
  }

  const newProduct = await prisma.items.create({
    data: {
      image,
      title,
      description,
      price,
      created_at,
    },
  });
  return {
    success: true,
    data: newProduct,
  };
};

const removeProduct = async ({ id }: { id: number }) => {
  const remove = await prisma.items.delete({
    where: {
      id: id,
    },
  });
};

const editProduct = async ({
  id,
  image,
  title,
  description,
  price,
}: productType) => {
  const validate = { id, image, title, description, price };

  if (!validate) {
    return {
      success: false,
      message: "Required fields are missing!",
    };
  }

  try {
    const editProduct = await prisma.items.update({
      where: { id },
      data: {
        id,
        image,
        title,
        description,
        price,
      },
    });
    return {
      success: true,
      data: editProduct,
    };
  } catch (error) {
    return {
      success: false,
      message: "Error updating product",
    };
  }
};

const myCart = async (userID: number) => {
  try {
    const response = await prisma.cart.findMany({
      where: {
        userID: userID,
      },
    });

    if (!response) {
      return {
        succsess: false,
        message: "Cart Is Empty",
      };
    }
    return response;
  } catch (error) {
    return error;
  }
};
const removeFromCart = async (userID: number, itemID: number) => {
  try {
    const existingCartItem = await prisma.cart.findFirst({
      where: {
        userID: userID,
        itemID: itemID,
      },
    });

    if (!existingCartItem) {
      return { error: "Product cannot be fined in Cart" };
    }

    const response = await prisma.cart.delete({
      where: {
        id: existingCartItem.id,
      },
    });

    return response;
  } catch (error) {
    return error;
  }
};

const addToCart = async ({ userID, itemID }: cart) => {
  try {
    const response = await prisma.cart.create({
      data: {
        userID,
        itemID,
      },
    });

    return {
      success: true,
      data: response,
    };
  } catch (message) {
    return message;
  }
};

export {
  items,
  creatProduct,
  myCart,
  addToCart,
  removeProduct,
  editProduct,
  removeFromCart,
};
