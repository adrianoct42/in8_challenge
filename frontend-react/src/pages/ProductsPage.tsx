import { useEffect, useState } from "react";
import ProductCard from "../components/ProductCard";
import { useProductsNat } from "../hooks/useProductsNat";
import { useProductsAll } from "../hooks/useProductsAll";
import { useProductsInt } from "../hooks/useProductsInt";
import toast from "react-hot-toast";
import type { IntProdType, NatProdType } from "../types/types";

type ProductType = NatProdType | IntProdType;

export default function ProductsPage() {
  const { productsNat, isLoadingNat } = useProductsNat();
  const { productsInt, isLoadingInt } = useProductsInt();
  const { productsAll, isLoadingAll } = useProductsAll();
  const [search, setSearch] = useState("");
  const [, setOriginalProducts] = useState<ProductType[]>([]);
  const [products, setProducts] = useState<ProductType[]>([]);
  const [selected, setSelected] = useState("Todos");

  useEffect(() => {
    let baseProducts: ProductType[] = [];

    if (selected === "Todos") {
      baseProducts = productsAll ?? [];
    } else if (selected === "Nacional") {
      baseProducts = productsNat?.data ?? [];
    } else {
      baseProducts = productsInt?.data ?? [];
    }

    // Salva os produtos de acordo com o filtro:
    setOriginalProducts(baseProducts);

    // Se digitou algo, filtra pela digitação e busca pelo campo NOME/NAME
    // Se nada foi digitado, retorna simplesmente os produtos originais.
    setProducts(
      search.length > 0
        ? baseProducts.filter((p) => {
            const name = "nome" in p ? p.nome : p.name;
            return name.toLowerCase().includes(search.toLowerCase());
          })
        : baseProducts
    );
  }, [
    productsAll,
    productsInt?.data,
    productsNat?.data,
    search,
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

  function getRandomIndex(): number {
    return Math.floor(Math.random() * 4);
  }

  return (
    <>
      <div className="flex items-center w-full mt-8 px-4">
        <p className="text-2xl flex justify-center w-full m-0 p-0">
          Bem vindo a página de Produtos! Adicione itens no carrinho clicando no
          ícone no card!
        </p>
        <div className="flex-shrink-0 py-2">
          <div className="inline-flex rounded-full overflow-hidden border-2 border-blue-600">
            {buttons.map((label) => (
              <button
                key={label}
                onClick={() => {
                  setSelected(label);
                  setSearch("");
                }}
                className={`text-sm px-6 py-2 font-medium transition-colors
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
          <div className="flex justify-center mt-6">
            <input
              type="text"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Buscar produto..."
              className="px-4 py-2 w-72 border-2 border-blue-600 rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400"
            />
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
                  imagem={prod.gallery[getRandomIndex()]}
                  handleCart={() => handleCartAdd(prod)}
                />
              );
            }
          })}
      </div>
    </>
  );
}
