import { useMutation } from "@tanstack/react-query";
import { purchaseCart } from "../services/apiProducts";
import toast from "react-hot-toast";

export function useProductMutation() {
  const { mutate: purchaseItems, isPending: isPurchasing } = useMutation({
    mutationFn: purchaseCart,
    onSuccess: () => {
      toast.success("Itens comprados com sucesso! Obrigado!");
      localStorage.clear();
    },
  });

  return { purchaseItems, isPurchasing };
}
