import { useQuery } from "@tanstack/react-query";
import { getAllPurchased } from "../services/apiProducts";

export function useProductsPurchased() {
  const {
    isLoading: isLoadingPurchased,
    data: productsPurchased,
    error,
  } = useQuery({
    queryKey: ["products-purchased"],
    queryFn: getAllPurchased,
  });

  return { isLoadingPurchased, productsPurchased, error };
}
