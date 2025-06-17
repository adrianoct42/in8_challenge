import { useEffect, useState } from "react";
import type { NatProdType, IntProdType } from "../types/types";
import { useProductMutation } from "../hooks/useProductMutation";
import FloatingButton from "../components/FloatingButton";
import { BsFillCartCheckFill } from "react-icons/bs";
import CartListItem from "../components/CartListItem";

export default function CartPage() {
  const [cartItems, setCartItems] = useState<(NatProdType | IntProdType)[]>([]);
  const { purchaseItems } = useProductMutation();

  useEffect(() => {
    const stored = JSON.parse(localStorage.getItem("cart") || "[]");
    setCartItems(stored);
  }, []);

  function handleSubmit() {
    purchaseItems();
  }

  return (
    <>
      <form onSubmit={handleSubmit}>
        <div className="flex flex-col w-full my-8 px-4">
          <p className="text-2xl flex justify-center m-0 p-0">
            Esses são seus itens do carrinho. Para finalizar a compra, basta
            clicar no botão da direita!
          </p>

          {cartItems.length > 0 ? (
            <>
              <CartListItem cartItems={cartItems} setCartItems={setCartItems} />
              <FloatingButton type="submit" navigation="/products">
                <BsFillCartCheckFill size={28} />
              </FloatingButton>
            </>
          ) : (
            <p className="text-2xl text-center mt-16">
              Carrinho vazio! Adicione produtos na tela de Produtos.
            </p>
          )}
        </div>
      </form>
    </>
  );
}
