pragma solidity >=0.4.22 <0.9.0;


//1. Model the publication [X]
//2. Store the video and the publication [X]
//3. Upload the publication [X]
//4. list publications [X]
contract MusicianHelper{
    uint public publicationCount = 0;
    string public name = "Musician Helper";

    //2.Store the publications with the vídeos
    mapping(uint => Publication) public publications;


    //3.Upload the publication on black chain
    event UploadedPublication(
        uint id,
        string title,
        string description,
        address author,
        string videoHash
    );

    //1. Model the publication
    struct Publication{
        uint id;
        string title;
        string description;
        address author;
        string videoHash;
    }

    constructor(){

    }

    function uploadPublication(string memory _videoHash, string memory _title, string memory _description) public {
        //making sure the video hash exists
        require(bytes(_videoHash).length > 0);
        //making sure the title of the publication exist
        require(bytes(_title).length > 0);
        //making sure the uploader address exist
        require(msg.sender != address(0));

        //increment publication count
        publicationCount++;

        //add the publication to the contract
        publications[publicationCount] = Publication(publicationCount, _title, _description, msg.sender, _videoHash);

        //add the publication to the blockchain
        emit UploadedPublication(publicationCount, _title, _description, msg.sender, _videoHash);
    }



    
}