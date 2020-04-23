

  import 'package:dbdummy/model/petDisplayModel.dart';
int i;
List<bool> favourites= List();

Map <int, bool> favPets={0: false};
  
PetDisplayModel petDisplayModel= PetDisplayModel(); 
class BuyerModel {

  String _imageURL;
  bool _favourite=false;
  String _petUID;
  String _petName;
  
  String _petAge;
  
  String _petBreed;
  
  String _petGender;
  String _petDescription;
  set petUID(String petUID)
  {
    this._petUID=petUID;
  }
  String get petUID=>_petUID;

  set petName(String petName)
   {
     this._petName=petName;
   }
   String get petName=>_petName;
   set petAge(String petAge)
   {
     this._petAge=petAge;
   }
   String get petAge=>_petAge;
   set petBreed(String petBreed)
   {
     this._petBreed=petBreed;
   }
   String get petBreed=>_petBreed;
   set petGender(String petGender)
   {
     this._petGender=petGender;
   }
   String get petGender=>_petGender;
   set petDescription(String petDescription)
   {
     this._petDescription=petDescription;
   }
   String get petDescription=>_petDescription;

  

   set imageURL(String imageURL)
   {
     this._imageURL=imageURL;
   }
   String get imageURL=>_imageURL;
  set favourite(bool favourite)
  {
    this._favourite=favourite;
  }
 bool get favourite=> _favourite;



}
