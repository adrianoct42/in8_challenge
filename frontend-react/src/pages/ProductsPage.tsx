import { useEffect, useState } from "react";
import ProductCard from "../components/ProductCard";
import { useProductsNat } from "../hooks/useProductsNat";
import { useProductsAll } from "../hooks/useProductsAll";
import { useProductsInt } from "../hooks/useProductsInt";
import toast from "react-hot-toast";
import type { IntProdType, NatProdType } from "../types/types";

type ProductType = NatProdType | IntProdType;

function ProductsPage() {
  const { productsNat, isLoadingNat } = useProductsNat();
  const { productsInt, isLoadingInt } = useProductsInt();
  const { productsAll, isLoadingAll } = useProductsAll();
  const [products, setProducts] = useState<ProductType[]>([]);
  const [selected, setSelected] = useState("All");

  useEffect(() => {
    if (selected === "All") {
      setProducts(productsAll ?? []);
    } else if (selected === "National") {
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

  const buttons = ["All", "National", "International"];

  function handleCartAdd(cartItem: object): void {
    const existingCart = JSON.parse(localStorage.getItem("cart") || "[]");
    existingCart.push(cartItem);
    localStorage.setItem("cart", JSON.stringify(existingCart));
    toast.success("Item adicionado no carrinho!");
  }

  return (
    <>
      <div className="flex justify-end w-full mt-8 px-4">
        <p className="text-2xl flex justify-center w-full m-0 p-0">
          Bem vindo a página de Produtos! Adicione itens no carrinho clicando no
          ícone no card!
        </p>
        <div className="flex-shrink-0">
          <div className="inline-flex rounded-full overflow-hidden border border-blue-600">
            {buttons.map((label) => (
              <button
                key={label}
                onClick={() => setSelected(label)}
                className={`px-6 py-2 text-sm font-medium transition-colors
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
          products.map((prod, idx) => {
            if ("nome" in prod && "preco" in prod && "imagem" in prod) {
              return (
                <ProductCard
                  key={`nat-${idx}`}
                  nome={prod.nome}
                  preco={prod.preco}
                  imagem={"./public/placeholder.png"}
                  handleCart={() => handleCartAdd(prod)}
                />
              );
            }

            if ("name" in prod && "price" in prod && "gallery" in prod) {
              return (
                <ProductCard
                  key={`int-${idx}`}
                  nome={prod.name}
                  preco={prod.price}
                  imagem={"./public/placeholder.png"}
                  handleCart={() => handleCartAdd(prod)}
                />
              );
            }

            return null;
          })}
      </div>
    </>
  );
}

export default ProductsPage;
