import { useQuery } from "@tanstack/react-query";
import { getProductsNat } from "../services/apiProducts";

export function useProductsNat() {
  const {
    isLoading: isLoadingNat,
    data: productsNat,
    error,
  } = useQuery({
    queryKey: ["products-nat"],
    queryFn: getProductsNat,
  });

  return { isLoadingNat, productsNat, error };
}
