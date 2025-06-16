import type { IntProdType, NatProdType } from "../types/types";
import { FaTrash } from "react-icons/fa";
import { cartCard } from "./CartCard";
import toast from "react-hot-toast";

type CartListItemProps = {
  cartItems: (NatProdType | IntProdType)[];
  setCartItems: React.Dispatch<
    React.SetStateAction<(NatProdType | IntProdType)[]>
  >;
  isPurchasedPage?: boolean;
};

export default function CartListItem({
  cartItems,
  setCartItems,
  isPurchasedPage = false,
}: CartListItemProps) {
  function handleRemove(name: string) {
    const updatedCart = cartItems.filter((item) => {
      const itemName = "nome" in item ? item.nome : item.name;
      return itemName !== name;
    });

    localStorage.setItem("cart", JSON.stringify(updatedCart));
    setCartItems(updatedCart);
    toast.success("Item removido do carrinho!");
  }

  return (
    <div className="mt-16 w-[700px] flex-col items-center space-y-4 mx-auto">
      {cartItems.map((item: NatProdType | IntProdType, index: number) => {
        const name = "nome" in item ? item.nome : item.name;
        const price = "preco" in item ? item.preco : item.price;

        return (
          <div
            key={index}
            className="flex items-center justify-between space-x-4 w-full"
          >
            <div className="bg-blue-300 rounded-full border-2 px-6 py-3 shadow-md w-full">
              {cartCard({ name, price })}
            </div>
            {!isPurchasedPage ? (
              <FaTrash
                size={20}
                onClick={() => handleRemove(name)}
                className="text-red-600 hover:text-red-800 cursor-pointer"
              />
            ) : null}
          </div>
        );
      })}
    </div>
  );
}
