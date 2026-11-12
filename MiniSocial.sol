// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    
    // 1. Déclaration de la structure Post
    struct Post {
        string message;
        address author;
    }

    // 2. Liste des messages (tableau dynamique)
    Post[] public posts;

    // 3. Fonction de Publication
    function publishPost(string memory _message) public {
        posts.push(Post({
            message: _message,
            author: msg.sender
        }));
    }

    // 4. Fonction de Consultation
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Index invalide : le post n'existe pas.");
        Post memory p = posts[index];
        return (p.message, p.author);
    }

    // 5. Fonction pour Récupérer le Nombre de Messages
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}