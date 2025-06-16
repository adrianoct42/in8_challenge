import { useEffect, useState } from "react";
import Sidebar from "../components/Sidebar";
import type { IntProdType, NatProdType } from "../types/types";
import CartListItem from "../components/CartListItem";
import { useProductsPurchased } from "../hooks/useProductsPruchased";

export default function ReportPage() {
  const [purchasedItems, setPurchasedItems] = useState<
    (NatProdType | IntProdType)[]
  >([]);
  const { productsPurchased } = useProductsPurchased();
  console.log(purchasedItems);

  useEffect(() => {
    setPurchasedItems(productsPurchased ?? []);
  }, [productsPurchased]);

  return (
    <>
      <Sidebar />
      <div className="flex flex-col w-full my-8 px-4">
        <p className="text-2xl flex justify-center m-0 p-0">
          Esses são seus itens já comprados:
        </p>

        {purchasedItems.length > 0 ? (
          <>
            <CartListItem
              cartItems={purchasedItems}
              setCartItems={setPurchasedItems}
              isPurchasedPage={true}
            />
          </>
        ) : (
          <p className="text-2xl text-center mt-16">
            Carrinho vazio! Adicione produtos na tela de Produtos.
          </p>
        )}
      </div>
    </>
  );
}
