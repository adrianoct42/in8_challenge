export type NatProdType = {
  nome: string;
  descricao: string;
  categoria: string;
  imagem: string;
  preco: number;
  material: string;
  departamento: string;
};

export type IntProdType = {
  name: string;
  description: string;
  categoria: string;
  gallery: string[];
  price: number;
  discountValue: number;
  hasDiscount: boolean;
  details: object;
};
