import axios from "axios";
import type { IntProdType, NatProdType } from "../types/types";

axios.defaults.baseURL = "http://localhost:3000/";

export async function getProductsNat() {
  const products = await axios.get("product-nat/all");
  return products;
}

export async function getProductsInt() {
  const products = await axios.get("product-int/all");
  return products;
}

export async function getAllProducts() {
  const [productsNat, productsInt] = await Promise.all([
    axios.get("product-nat/all"),
    axios.get("product-int/all"),
  ]);

  return [...productsNat.data, ...productsInt.data];
}

export async function purchaseCart() {
  const cartItems = JSON.parse(localStorage.getItem("cart") || "[]");
  cartItems.map((item: NatProdType | IntProdType) => {
    if ("nome" in item && "imagem" in item) {
      axios.post("product-nat/add-cart", item);
    } else {
      axios.post("product-int/add-cart", item);
    }
  });
}
