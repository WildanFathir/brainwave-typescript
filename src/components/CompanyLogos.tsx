import React from 'react';

import { companyLogos } from '../constants';

interface CompanyLogosProps {
  className: string;
}

const CompanyLogos: React.FC<CompanyLogosProps> = ({ className }) => {
  return (
    <div className={className}>
      <h5 className="mb-6 text-center tagline text-n-1/50">
        Helping people create beatiful content at
      </h5>
      <ul className="flex">
        {companyLogos.map((logo, index) => (
          <li key={index} className="flex items-center justify-center flex-1 h-[8.5rem]">
            <img src={logo} alt={logo} width={134} height={28} />
          </li>
        ))}
      </ul>
    </div>
  );
};

export default CompanyLogos;
