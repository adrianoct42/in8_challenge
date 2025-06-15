import { useQuery } from "@tanstack/react-query";
import { getProductsInt } from "../services/apiProducts";

export function useProductsInt() {
  const {
    isLoading: isLoadingInt,
    data: productsInt,
    error,
  } = useQuery({
    queryKey: ["products-int"],
    queryFn: getProductsInt,
  });

  return { isLoadingInt, productsInt, error };
}
