#include "InputFile.hpp"
#include <fstream>
#include <cstring>

InputFile::InputFile()
   : currentPosition_(0)
{
   //inputBuffer_ = new unsigned char [0x1000000];
}

InputFile::~InputFile()
{
   //delete [] inputBuffer_;
}

bool InputFile::OpenFile(std::string fileName)
{
   FILE* fp = fopen(fileName.c_str(), "rb");
   if (!fp)
   {
      printf("Error:%s file not found\n\n", fileName.c_str());
      exit(1);
   }

   fseek(fp, 0L, SEEK_END);
   uint32_t lSize = ftell( fp );
   rewind( fp );

   unsigned char* buffer = new unsigned char[lSize];
   fread( buffer , lSize, 1 , fp);

   for (int i = 0; i < lSize; i++)
   {
      inputBuffer_.push_back(buffer[i]);
   }
   inputBuffer_.push_back(0xEF); // push an end of file at the end
   fclose(fp);
   
   return true;
}


void InputFile::CloseFile(std::string fileName)
{
}

unsigned char InputFile::GetCurrentCharacter()
{
   return inputBuffer_.at(currentPosition_);
}


unsigned char InputFile::GetNextCharacter()
{
  return inputBuffer_.at(++currentPosition_);
}

unsigned int InputFile::GetCurrentCharacterLocation()
{
   return currentPosition_;
}

void InputFile::SetCurrentCharacterLocation(unsigned int position)
{
   currentPosition_ = position;
}


