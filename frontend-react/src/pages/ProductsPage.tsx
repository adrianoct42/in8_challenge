import { useEffect, useState } from "react";
import ProductCard from "../components/ProductCard";
import { useProductsNat } from "../hooks/useProductsNat";
import { useProductsAll } from "../hooks/useProductsAll";
import { useProductsInt } from "../hooks/useProductsInt";
import toast from "react-hot-toast";
import type { IntProdType, NatProdType } from "../types/types";
import Sidebar from "../components/Sidebar";

type ProductType = NatProdType | IntProdType;

export default function ProductsPage() {
  const { productsNat, isLoadingNat } = useProductsNat();
  const { productsInt, isLoadingInt } = useProductsInt();
  const { productsAll, isLoadingAll } = useProductsAll();
  const [products, setProducts] = useState<ProductType[]>([]);
  const [selected, setSelected] = useState("Todos");

  useEffect(() => {
    if (selected === "Todos") {
      setProducts(productsAll ?? []);
    } else if (selected === "Nacional") {
      setProducts(productsNat?.data ?? []);
    } else {
      setProducts(productsInt?.data ?? []);
    }
  }, [
    productsAll,
    productsInt?.data,
    productsNat?.data,
    selected,
    setProducts,
  ]);

  const buttons = ["Todos", "Nacional", "Internacional"];

  function handleCartAdd(cartItem: object): void {
    const existingCart = JSON.parse(localStorage.getItem("cart") || "[]");
    existingCart.push(cartItem);
    localStorage.setItem("cart", JSON.stringify(existingCart));
    toast.success("Item adicionado no carrinho!");
  }

  return (
    <>
      <Sidebar />
      <div className="flex items-center w-full mt-8 px-4">
        <p className="text-2xl flex justify-center w-full m-0 p-0">
          Bem vindo a página de Produtos! Adicione itens no carrinho clicando no
          ícone no card!
        </p>
        <div className="flex-shrink-0">
          <div className="inline-flex rounded-full overflow-hidden border-2 border-blue-600">
            {buttons.map((label) => (
              <button
                key={label}
                onClick={() => setSelected(label)}
                className={`text-sm px-6 py-2  font-medium transition-colors
            ${
              selected === label
                ? "bg-blue-600 text-white"
                : "bg-white text-blue-600 hover:bg-blue-100"
            }
          `}
              >
                {label}
              </button>
            ))}
          </div>
        </div>
      </div>
      <div className="grid grid-cols-4 gap-8 mt-8 max-w-5xl mx-auto">
        {!isLoadingAll &&
          !isLoadingNat &&
          !isLoadingInt &&
          products.map((prod, index) => {
            if ("nome" in prod && "preco" in prod && "imagem" in prod) {
              return (
                <ProductCard
                  key={`nat-${index}`}
                  nome={prod.nome}
                  preco={prod.preco}
                  imagem={prod.imagem}
                  handleCart={() => handleCartAdd(prod)}
                />
              );
            }

            if ("name" in prod && "price" in prod && "gallery" in prod) {
              return (
                <ProductCard
                  key={`int-${index}`}
                  nome={prod.name}
                  preco={prod.price}
                  imagem={prod.gallery[0]}
                  handleCart={() => handleCartAdd(prod)}
                />
              );
            }
          })}
      </div>
    </>
  );
}
