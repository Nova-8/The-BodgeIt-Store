import React from 'react';

const UserProfile = ({ username }) => {
  const userInput = '<script>alert("Vulnerabilidade XSS!")</script>';
  
  return (
    <div>
      <h1>Perfil de {username}</h1>
      <p>Bem-vindo(a) ao perfil de {username}!</p>
      <p>{userInput}</p> {/* Esta linha contém a vulnerabilidade */}
    </div>
  );
};

export default UserProfile;
