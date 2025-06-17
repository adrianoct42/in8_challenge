import { Link } from "react-router-dom";
import { FaHome, FaShoppingCart, FaBook } from "react-icons/fa";

export default function Sidebar() {
  return (
    <div className="h-full w-64 bg-blue-800 text-white shadow-lg flex flex-col">
      <div className="p-6 text-2xl font-bold border-b border-blue-700">
        Navegação
      </div>
      <nav className="flex flex-col mt-6 space-y-2 px-4">
        <Link
          to="/products"
          className="flex items-center gap-3 py-2 px-4 rounded hover:bg-blue-700 transition"
        >
          <FaHome /> Produtos
        </Link>
        <Link
          to="/cart"
          className="flex items-center gap-3 py-2 px-4 rounded hover:bg-blue-700 transition"
        >
          <FaShoppingCart /> Carrinho
        </Link>
        <Link
          to="/report"
          className="flex items-center gap-3 py-2 px-4 rounded hover:bg-blue-700 transition"
        >
          <FaBook /> Relatório de Compras
        </Link>
      </nav>
    </div>
  );
}
