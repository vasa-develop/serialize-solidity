pragma solidity ^0.4.19;

import "./Seriality.sol";

contract Serialize is Seriality{
	string [] arr = ["string0", "string1", "string2", "string3", "string4"];

	function getBytes(uint startindex, uint endindex) public view returns(bytes serialized){

        require(endindex >= startindex);
        
        if(endindex > (arr.length - 1)){
            endindex = arr.length - 1;
        }
        
        //64 byte is needed for safe storage of a single string.
        //((endindex - startindex) + 1) is the number of strings we want to pull out.
        uint offset = 64*((endindex - startindex) + 1);
        
        bytes memory buffer = new  bytes(offset);
        string memory out1  = new string(32);
        
        
        for(uint i = endindex; i >= startindex; i--){
            out1 = arr[i];
            
            stringToBytes(offset, bytes(out1), buffer);
            offset -= sizeOfString(out1);
        }
        
        return (buffer);
    }
}