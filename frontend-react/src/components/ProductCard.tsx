import React, { useState, type MouseEventHandler } from "react";
import { FaCartPlus } from "react-icons/fa";

type ProductCardProps = {
  nome: string;
  preco: number;
  imagem: string;
  handleCart: MouseEventHandler<HTMLButtonElement>;
};

const ProductCard: React.FC<ProductCardProps> = ({
  nome,
  preco,
  imagem,
  handleCart,
}) => {
  const [imgSrc, setImgSrc] = useState(imagem);

  return (
    <div className="w-64 h-96 bg-white shadow-md rounded-2xl overflow-hidden border border-gray-200">
      <div className="h-2/3 w-full">
        <img
          src={imgSrc}
          onError={() => setImgSrc("/placeholder.png")}
          alt={nome}
          className="w-full h-full object-cover"
        />
      </div>
      <div className="border-t-2 border-gray-300 h-1/3 flex flex-col justify-center px-4 py-2">
        <h3 className="text-md font-semibold text-gray-800">{nome}</h3>
        <p className="text-md text-green-600 font-bold mt-1">R$ {preco}</p>
        <button
          onClick={handleCart}
          className="bg-blue-400 hover:bg-blue-600 text-white rounded-full p-2 ml-auto"
        >
          <FaCartPlus size={28} />
        </button>
      </div>
    </div>
  );
};

export default ProductCard;
