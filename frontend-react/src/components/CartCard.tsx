export const cartCard = ({ name, price }: { name: string; price: number }) => (
  <div className="flex items-center space-x-4 justify-between">
    <span className="font-semibold">{name}</span>
    <span className="text-gray-700">R$ {price}</span>
  </div>
);
