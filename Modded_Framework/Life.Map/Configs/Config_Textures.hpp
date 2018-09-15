/*
Texture with format {"nameoftexture",{"textures","anothertexture"},"conditions"}
If a vehicle has more then 1 hidden selection texture which needs changing, then put multiple textures in 2nd element
*/
class Textures {
    class Vehicle {
        class Default {
            textures[] = {};
        };

        class jonzie_car_base {
            textures[] = {
                {"Yellow",{"#(argb,8,8,3)color(0.6,0.3,0.01,1)"},""},
                {"Aqua",{"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"},""},
                {"Black",{"#(argb,8,8,3)color(0,0,0,1)"},""},
                {"Pink",{"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"},""},
                {"Purple",{"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"},""},
                {"Green",{"#(argb,8,8,3)color(0,1,0.25098,1)"},""},
                {"Light Green",{"#(argb,8,8,3)color(0,0.54902,0.137255,1)"},""},
                {"Navy Blue",{"#(argb,8,8,3)color(0,0,1,1)"},""}
            };
        };

        class B_Quadbike_01_F : jonzie_car_base {};

        class Jonzie_XB : jonzie_car_base {};
        class Jonzie_Mini_Cooper : jonzie_car_base {};
        class Jonzie_Ceed : jonzie_car_base {};
        class Jonzie_30CSL : jonzie_car_base {};
        class Jonzie_Transit : jonzie_car_base {};
        class Jonzie_Mini_Cooper_r_spec : jonzie_car_base {};
        class Jonzie_Raptor : jonzie_car_base {};
        class Jonzie_Escalade : jonzie_car_base {};
        class Jonzie_Viper : jonzie_car_base {};
        class Jonzie_Corolla : jonzie_car_base {};
        class Jonzie_Datsun_510 : jonzie_car_base {};
        class Jonzie_Datsun_Z432 : jonzie_car_base {};
        class Jonzie_Forklift : jonzie_car_base {};
        class Jonzie_Galant : jonzie_car_base {};
        class Jonzie_Quattroporte : jonzie_car_base {};
        class Jonzie_STI : jonzie_car_base {};
        class Jonzie_Superliner : jonzie_car_base {};
        class Jonzie_Tow_Truck : jonzie_car_base {};
        class Jonzie_VE : jonzie_car_base {};
        class Jonzie_Western : jonzie_car_base {};
        class Jonzie_Curtain : jonzie_car_base {};
        class Jonzie_Curtain_Roadtrain : jonzie_car_base {};
        class Jonzie_Flatbed : jonzie_car_base {};
        class Jonzie_Flatbed_Roadtrain : jonzie_car_base {};
        class Jonzie_Race_Trailer : jonzie_car_base {};
    };
};