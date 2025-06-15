import { useQuery } from "@tanstack/react-query";
import { getAllProducts } from "../services/apiProducts";

export function useProductsAll() {
  const {
    isLoading: isLoadingAll,
    data: productsAll,
    error,
  } = useQuery({
    queryKey: ["products-all"],
    queryFn: getAllProducts,
  });

  return { isLoadingAll, productsAll, error };
}
