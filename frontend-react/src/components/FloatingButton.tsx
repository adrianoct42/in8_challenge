import React, { type JSX } from "react";
import { useNavigate } from "react-router-dom";

type FloatingButtonProps = {
  navigation?: string;
  position?: string;
  children: JSX.Element;
  type?: "button" | "submit" | "reset";
};

const FloatingButton: React.FC<FloatingButtonProps> = ({
  navigation,
  children,
  type,
  position = "bottom-12 right-12",
}) => {
  const navigate = useNavigate();

  return (
    <button
      type={type}
      onClick={navigation ? () => navigate(navigation) : undefined}
      className={`fixed ${position} z-50 bg-blue-600 hover:bg-blue-700 text-white rounded-full w-16 h-16 shadow-lg flex items-center justify-center`}
    >
      {children}
    </button>
  );
};

export default FloatingButton;
