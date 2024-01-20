import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/model/address.dart';
import 'package:sneaker_store_mobile_app/model/bank.dart';
import 'package:sneaker_store_mobile_app/model/bill.dart';
import 'package:sneaker_store_mobile_app/model/bill_item.dart';
import 'package:sneaker_store_mobile_app/model/branch_address.dart';
import 'package:sneaker_store_mobile_app/model/branch_tel_number.dart';
import 'package:sneaker_store_mobile_app/model/brand.dart';
import 'package:sneaker_store_mobile_app/model/customer.dart';
import 'package:sneaker_store_mobile_app/model/customer_addresse.dart';
import 'package:sneaker_store_mobile_app/model/customer_bank_account.dart';
import 'package:sneaker_store_mobile_app/model/customer_defect_image.dart';
import 'package:sneaker_store_mobile_app/model/customer_product_image.dart';
import 'package:sneaker_store_mobile_app/model/customer_wishlist.dart';
import 'package:sneaker_store_mobile_app/model/delivery_branch.dart';
import 'package:sneaker_store_mobile_app/model/delivery_receipt_pic.dart';
import 'package:sneaker_store_mobile_app/model/delivery_service.dart';
import 'package:sneaker_store_mobile_app/model/order_status.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/product_cat.dart';
import 'package:sneaker_store_mobile_app/model/product_collection.dart';
import 'package:sneaker_store_mobile_app/model/product_condition.dart';
import 'package:sneaker_store_mobile_app/model/product_image.dart';
import 'package:sneaker_store_mobile_app/model/product_selling.dart';
import 'package:sneaker_store_mobile_app/model/product_with_size.dart';
import 'package:sneaker_store_mobile_app/model/shipping_method.dart';
import 'package:sneaker_store_mobile_app/model/shoe_size.dart';
import 'package:sneaker_store_mobile_app/model/store_branch.dart';

class CentralStore extends ChangeNotifier {
  //=== var: popupShown
  bool _popupShown = false;
  bool get popupShown => _popupShown;
  void setPopupshown(bool popupShown) {
    _popupShown = popupShown;
    notifyListeners();
  } //ef
//======

  // TEST FOR GIT
  // TEST FOR GITHUN

  //=== var: customerList
  late Customer _customer;
  Customer get customer => _customer;
  void setCustomerlist(Customer customer) {
    _customer = customer;
    notifyListeners();
  } //ef

  void setCustomerFirstname(String val) {
    _customer.firstName = val;
  }

  void initializeCustomer() {
    _customer = Customer(
        firstName: "Sattavath",
        lastName: "Phitsavath",
        age: "22",
        vacationMode: false,
        email: "huangguifu21@gmail.com",
        birthday: "19/01/2001",
        emailSubscribtion: true,
        defaultAddress: 0,
        customerAddresses: [
          CustomerAddresse(
              address: Address(
                  sellerName: "Construction store (Sattavath Phitsavath)",
                  sellerTelNumber: "0933860614",
                  province: "Savannakhet",
                  city: "Kaisone Phomvihane",
                  village: "Phonesaiy Village",
                  addressDetail: "South street 191",
                  postCode: "10001")),
          CustomerAddresse(
              address: Address(
                  sellerName: "My Home (Sattavath Phitsavath)",
                  sellerTelNumber: "0933860614",
                  province: "Pakse",
                  city: "Poupha City",
                  village: "Somewhere Village",
                  addressDetail: "North street 898",
                  postCode: "20001")),
        ],
        customerBankAccounts: [
          CustomerBankAccount(
              bank: Bank(bankName: "SCB"),
              accountName: "Sattavath Phitsavath",
              accountNumber: "9115649876346",
              accountQr: "The Pic QR"),
          CustomerBankAccount(
              bank: Bank(bankName: "BCEL"),
              accountName: "ສັດຕະວັດ ພິດສະຫວາດ",
              accountNumber: "54649847321698",
              accountQr: "The Pic QR")
        ],
        customerWishlists: [
          CustomerWishlist(
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36.5),
              product: productLists[2]),
          CustomerWishlist(
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 37.5),
              product: productLists[5]),
          CustomerWishlist(
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 38.5),
              product: productLists[1]),
          CustomerWishlist(
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 39.5),
              product: productLists[8]),
        ],
        productSellings: [
          ProductSelling(
              qty: 3,
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36.5),
              productLiveDate: "20/03/2020",
              orderStatus: OrderStatus(statusName: "Pending"),
              customerPlacedPrice: 4900,
              product: productLists[0],
              productCondition: ProductCondition(conditionName: "Brand new"),
              productDefect: false,
              boxDefect: false,
              customerProductImages: [
                CustomerProductImage(
                    productImage: "The Customer self-shot product image")
              ],
              customerDefectImages: [
                CustomerDefectImage(defectImage: "The customr self-shot images")
              ]),
          ProductSelling(
              qty: 10,
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36.5),
              productLiveDate: "16/05/2020",
              orderStatus: OrderStatus(statusName: "Active Ask"),
              customerPlacedPrice: 12000,
              product: productLists[1],
              productCondition: ProductCondition(conditionName: "Brand new"),
              productDefect: false,
              boxDefect: false,
              customerProductImages: [
                CustomerProductImage(
                    productImage: "The Customer self-shot product image")
              ],
              customerDefectImages: [
                CustomerDefectImage(defectImage: "The customr self-shot images")
              ]),
          ProductSelling(
              qty: 1,
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36.5),
              productLiveDate: "15/12/2020",
              orderStatus: OrderStatus(statusName: "Pending"),
              customerPlacedPrice: 6000,
              product: productLists[2],
              productCondition: ProductCondition(conditionName: "Brand new"),
              productDefect: false,
              boxDefect: false,
              customerProductImages: [
                CustomerProductImage(
                    productImage: "The Customer self-shot product image")
              ],
              customerDefectImages: [
                CustomerDefectImage(defectImage: "The customr self-shot images")
              ]),
          ProductSelling(
              qty: 2,
              shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36.5),
              productLiveDate: "12/10/2020",
              orderStatus: OrderStatus(statusName: "Shipment"),
              customerPlacedPrice: 12000,
              product: productLists[3],
              productCondition: ProductCondition(conditionName: "Brand new"),
              productDefect: false,
              boxDefect: false,
              customerProductImages: [
                CustomerProductImage(
                    productImage: "The Customer self-shot product image")
              ],
              customerDefectImages: [
                CustomerDefectImage(defectImage: "The customr self-shot images")
              ])
        ]);
  }
//======

  //=== var: buyingOrderStatusList
  List<OrderStatus> BuyingOrderStatusList = [
    OrderStatus(statusName: "Pending"),
    OrderStatus(statusName: "Processing"),
    OrderStatus(statusName: "Shipping"),
    OrderStatus(statusName: "Pending"),
    OrderStatus(statusName: "To Recieve"),
    OrderStatus(statusName: "Completed"),
    OrderStatus(statusName: "Canceled"),
    OrderStatus(statusName: "Return Refund"),
  ];
  List<OrderStatus> get buyingOrderStatusList => BuyingOrderStatusList;
  void setBuyingOrderstatuslist(List<OrderStatus> buyingOrderStatusList) {
    BuyingOrderStatusList = buyingOrderStatusList;
    notifyListeners();
  } //ef
//======

  //=== var: sizeList
  List<ShoeSize> SizeList = [
    ShoeSize(sizeType: "EU", sizeNumber: 35.5),
    ShoeSize(sizeType: "EU", sizeNumber: 36),
    ShoeSize(sizeType: "EU", sizeNumber: 36.5),
    ShoeSize(sizeType: "EU", sizeNumber: 37),
    ShoeSize(sizeType: "EU", sizeNumber: 37.5),
    ShoeSize(sizeType: "EU", sizeNumber: 38),
    ShoeSize(sizeType: "EU", sizeNumber: 38.5),
    ShoeSize(sizeType: "EU", sizeNumber: 39),
    ShoeSize(sizeType: "EU", sizeNumber: 39.5),
    ShoeSize(sizeType: "EU", sizeNumber: 40),
    ShoeSize(sizeType: "EU", sizeNumber: 40.5),
    ShoeSize(sizeType: "EU", sizeNumber: 41),
    ShoeSize(sizeType: "EU", sizeNumber: 41.5),
    ShoeSize(sizeType: "EU", sizeNumber: 42),
    ShoeSize(sizeType: "EU", sizeNumber: 42.5),
    ShoeSize(sizeType: "EU", sizeNumber: 43),
    ShoeSize(sizeType: "EU", sizeNumber: 43.5),
    ShoeSize(sizeType: "EU", sizeNumber: 44),
    ShoeSize(sizeType: "EU", sizeNumber: 44.5),
    ShoeSize(sizeType: "EU", sizeNumber: 45),
    ShoeSize(sizeType: "EU", sizeNumber: 45.5),
    ShoeSize(sizeType: "EU", sizeNumber: 46),
    ShoeSize(sizeType: "EU", sizeNumber: 46.5),
    ShoeSize(sizeType: "EU", sizeNumber: 47)
  ];
  List<ShoeSize> get sizeList => SizeList;
  void setSizelist(List<ShoeSize> sizeList) {
    SizeList = sizeList;
    notifyListeners();
  } //ef
//======

  //=== var: recentProductList
  List<Product> _recentProductList = [];
  List<Product> get recentProductList => _recentProductList;
  void setRecentproductlist(List<Product> recentProductList) {
    _recentProductList = recentProductList;
    notifyListeners();
  } //ef

  void appendRecentProduct(Product product) {
    _recentProductList.add(product);
  }

  void initializeRecentProductList() {
    _recentProductList = [
      productLists[0],
      productLists[1],
      productLists[2],
      productLists[5],
    ];
  }
//======

  //=== var: brandList
  List<Brand> BrandList = [
    Brand(
        brandName: "Nike",
        brandLogo:
            "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png"),
    Brand(
        brandName: "Gucci",
        brandLogo:
            "https://i.pinimg.com/originals/31/32/d7/3132d7cc02cdd9ceacd7bceb0738828d.png"),
    Brand(
        brandName: "Jordan",
        brandLogo:
            "https://cdn.freebiesupply.com/images/large/2x/air-jordan-logo-png-transparent.png"),
    Brand(
        brandName: "New Balance",
        brandLogo:
            "https://seeklogo.com/images/N/new-balance-logo-92A821DDB4-seeklogo.com.png"),
    Brand(
        brandName: "Asics",
        brandLogo:
            "https://companieslogo.com/img/orig/7936.T.D-8cfad757.png?t=1685353412"),
    Brand(
        brandName: "Fear of God",
        brandLogo:
            "https://i.pinimg.com/originals/ea/83/71/ea837126c830a6b78e1ebc0fff313df0.png"),
    Brand(
        brandName: "Stussy",
        brandLogo:
            "https://assets.stickpng.com/images/61fa8e24eec4c40004bacd50.png"),
    Brand(
        brandName: "Puma",
        brandLogo:
            "https://seeklogo.com/images/P/puma-logo-F9E13B654C-seeklogo.com.png"),
    Brand(
        brandName: "Salomon",
        brandLogo:
            "https://assets.stickpng.com/images/6011b1291b7ff00004506b3e.png"),
    Brand(
        brandName: "Chanel",
        brandLogo:
            "https://assets.stickpng.com/images/61336a2c82b156000425b39f.png"),
    Brand(
        brandName: "Reebok",
        brandLogo:
            "https://cdn.iconscout.com/icon/free/png-256/free-reebok-crossfit-3421601-2854282.png"),
    Brand(
        brandName: "Converse",
        brandLogo:
            "https://brandslogos.com/wp-content/uploads/images/large/converse-logo-1.png"),
    Brand(
        brandName: "Vans",
        brandLogo:
            "https://assets.stickpng.com/images/5842f005a6515b1e0ad75b0f.png"),
    Brand(
        brandName: "Hoka",
        brandLogo:
            "https://cdn.aboutstatic.com/file/591c57b865903b747f8c871dac4d6510.png?quality=75&transparent=1&trim=1&height=480&width=360"),
  ];
  List<Brand> get brandList => BrandList;
  void setBrandlist(List<Brand> brandList) {
    BrandList = brandList;
    notifyListeners();
  } //ef

//======

//=== var: mostPopularProductList
  List<Product> MostPopularProductList = [
    Product(
        name: "Nike Air Force 1 Low '07",
        retailPrice: 1899,
        SKU: "CW2288-111",
        colorway: "---",
        releaseDate: "28/07/2023",
        amountSold: 2184,
        productWithSizes: [
          ProductWithSize(
            inventoryQty: 11,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 34.5),
          ),
          ProductWithSize(
            inventoryQty: 21,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 24.5),
          ),
          ProductWithSize(
            inventoryQty: 31,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 35),
          ),
          ProductWithSize(
            inventoryQty: 23,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 35.5),
          ),
          ProductWithSize(
            inventoryQty: 22,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36),
          ),
        ],
        productCollection: ProductCollection(
            collectionName: "Nike Air Force 1",
            brand: Brand(
                brandName: "Nike",
                brandLogo:
                    "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png")),
        productCat: ProductCat(catName: "Sneaker"),
        productImages: [
          ProductImage(
              productImageUrl:
                  "https://d2cva83hdk3bwc.cloudfront.net/nike-air-force-11e2yp-1.jpg"),
        ]),
    Product(
        name: "Adidas Samba OG Black White Gum",
        retailPrice: 2999,
        SKU: "B75807-BZ0058",
        colorway: "Black White Gum",
        releaseDate: "---",
        amountSold: 538,
        productWithSizes: [
          ProductWithSize(
            inventoryQty: 11,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 34.5),
          ),
          ProductWithSize(
            inventoryQty: 21,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 24.5),
          ),
          ProductWithSize(
            inventoryQty: 31,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 35),
          ),
          ProductWithSize(
            inventoryQty: 23,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 35.5),
          ),
          ProductWithSize(
            inventoryQty: 22,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36),
          ),
        ],
        productCollection: ProductCollection(
            collectionName: "Adidas Samba",
            brand: Brand(
                brandName: "Adidas",
                brandLogo:
                    "https://logodownload.org/wp-content/uploads/2014/07/adidas-logo-0.png")),
        productCat: ProductCat(catName: "Sneaker"),
        productImages: [
          ProductImage(
              productImageUrl:
                  "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg"),
          ProductImage(
              productImageUrl:
                  "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-2.jpg"),
          ProductImage(
              productImageUrl:
                  "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-3.jpg"),
        ]),
    Product(
        name: "New Balance 530 White Silver Navy",
        retailPrice: 1990,
        SKU: "MR530SG",
        colorway: "White Silver Navy",
        releaseDate: "---",
        amountSold: 8093,
        productWithSizes: [
          ProductWithSize(
            inventoryQty: 11,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 34.5),
          ),
          ProductWithSize(
            inventoryQty: 21,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 24.5),
          ),
          ProductWithSize(
            inventoryQty: 31,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 35),
          ),
          ProductWithSize(
            inventoryQty: 23,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 35.5),
          ),
          ProductWithSize(
            inventoryQty: 22,
            shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 36),
          ),
        ],
        productCollection: ProductCollection(
            collectionName: "New Balance 530",
            brand: Brand(
                brandName: "New Balance",
                brandLogo:
                    "https://seeklogo.com/images/N/new-balance-logo-92A821DDB4-seeklogo.com.png")),
        productCat: ProductCat(catName: "Sneaker"),
        productImages: [
          ProductImage(
              productImageUrl:
                  "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-1.jpg"),
          ProductImage(
              productImageUrl:
                  "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-2.jpg"),
          ProductImage(
              productImageUrl:
                  "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-3.jpg"),
        ])
  ];
  List<Product> get mostPopularProductList => MostPopularProductList;
  void setMostPopularProductList(List<Product> mostPopularProductList) {
    MostPopularProductList = mostPopularProductList;
    notifyListeners();
  } //ef

  void appendMostPopularProductList(Product product) {
    MostPopularProductList.add(product);
  }
//======

  //=== var: productLists
  List<Product> ProductList = [];
  List<Product> get productLists => ProductList;
  void setProductlists(List<Product> productLists) {
    ProductList = productLists;
    notifyListeners();
  } //ef

  void initializeProductList() {
    ProductList = [
      Product(
          name: "New Balance 530 White Silver Navy",
          retailPrice: 1990,
          SKU: "MR530SG",
          colorway: "White Silver Navy",
          releaseDate: "---",
          amountSold: 8093,
          productWithSizes: [
            ProductWithSize(inventoryQty: 21, shoeSize: SizeList[0]),
            ProductWithSize(inventoryQty: 11, shoeSize: SizeList[1]),
            ProductWithSize(inventoryQty: 31, shoeSize: SizeList[2]),
            ProductWithSize(inventoryQty: 23, shoeSize: SizeList[3]),
            ProductWithSize(inventoryQty: 22, shoeSize: SizeList[4])
          ],
          productCollection: ProductCollection(
              collectionName: "New Balance 530",
              brand: Brand(
                  brandName: "New Balance",
                  brandLogo:
                      "https://seeklogo.com/images/N/new-balance-logo-92A821DDB4-seeklogo.com.png")),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-1.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-2.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-3.jpg"),
          ]),
      Product(
          name: "Nike Air Force 1 Low '07",
          retailPrice: 1899,
          lastSalePrice: 1000,
          SKU: "CW2288-111",
          colorway: "---",
          releaseDate: "28/07/2023",
          amountSold: 2184,
          productWithSizes: [
            ProductWithSize(inventoryQty: 21, shoeSize: sizeList[5]),
            ProductWithSize(inventoryQty: 11, shoeSize: sizeList[6]),
            ProductWithSize(inventoryQty: 31, shoeSize: sizeList[7]),
            ProductWithSize(inventoryQty: 23, shoeSize: sizeList[8]),
            ProductWithSize(inventoryQty: 22, shoeSize: sizeList[9])
          ],
          productCollection: ProductCollection(
              collectionName: "Nike Air Force 1",
              brand: Brand(
                  brandName: "Nike",
                  brandLogo:
                      "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png")),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/nike-air-force-11e2yp-1.jpg"),
          ]),
      Product(
          name: "Adidas Samba OG Black White Gum",
          retailPrice: 2999,
          lastSalePrice: 2000,
          SKU: "B75807-BZ0058",
          colorway: "Black White Gum",
          releaseDate: "---",
          amountSold: 538,
          productWithSizes: [
            ProductWithSize(inventoryQty: 15, shoeSize: sizeList[0]),
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[2]),
            ProductWithSize(inventoryQty: 2, shoeSize: sizeList[4]),
            ProductWithSize(inventoryQty: 1, shoeSize: sizeList[6]),
            ProductWithSize(inventoryQty: 20, shoeSize: sizeList[8])
          ],
          productCollection: ProductCollection(
              collectionName: "Adidas Samba",
              brand: Brand(
                  brandName: "Adidas",
                  brandLogo:
                      "https://logodownload.org/wp-content/uploads/2014/07/adidas-logo-0.png")),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-2.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-3.jpg"),
          ]),
      Product(
          name: "Puma X Juun.J Plexus Black",
          retailPrice: 5000,
          SKU: "391697-01",
          colorway: "---",
          releaseDate: "07/04/2023",
          amountSold: 0,
          productWithSizes: [
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[0]),
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[2]),
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[3]),
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[5]),
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[7])
          ],
          productCollection: ProductCollection(
              collectionName: "Puma X Juun.J", brand: brandList[7]),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/puma-x-juun.j-plexus-black-2.jpg"),
          ]),
      Product(
          name: "Gucci X Disney Mickey Mouse (W)",
          retailPrice: 9900,
          SKU: "602129-AYO70-9591",
          colorway: "Ivory/Orange/Multicolor",
          releaseDate: "---",
          amountSold: 0,
          productWithSizes: [
            ProductWithSize(inventoryQty: 1, shoeSize: sizeList[0]),
            ProductWithSize(inventoryQty: 1, shoeSize: sizeList[1]),
            ProductWithSize(inventoryQty: 1, shoeSize: sizeList[2]),
            ProductWithSize(inventoryQty: 1, shoeSize: sizeList[3]),
          ],
          productCollection: ProductCollection(
              collectionName: "Gucci X Disney", brand: brandList[2]),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/gucci-x-disney-mickey-mouse--w--1.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/gucci-x-disney-mickey-mouse--w--2.jpg")
          ]),
      Product(
          name: "Golden Goose Yeah Leather Sneakers Gold Laminated (W)",
          retailPrice: 16700,
          lastSalePrice: 10000,
          SKU: "GWF00130-F002196-65121",
          colorway: "Gold Laminated",
          releaseDate: "---",
          amountSold: 0,
          productWithSizes: [
            ProductWithSize(inventoryQty: 2, shoeSize: sizeList[0]),
          ],
          productCollection: ProductCollection(
              collectionName: "Golden Goose Yeah Leather",
              brand: Brand(
                  brandName: "Golden Goose",
                  brandLogo:
                      "https://seeklogo.com/images/G/golden-goose-logo-0E4DBCFBE7-seeklogo.com.png")),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/golden-goose-yeah-leather-sneakers-gold-laminated--w--1.jpg"),
          ]),
      Product(
          name: "Converse X Ader Error Chuck 70 High White",
          retailPrice: 6590,
          SKU: "A05351C",
          colorway: "---",
          releaseDate: "28/07/2023",
          amountSold: 4,
          productWithSizes: [
            ProductWithSize(inventoryQty: 15, shoeSize: sizeList[0]),
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[1]),
            ProductWithSize(inventoryQty: 2, shoeSize: sizeList[2]),
            ProductWithSize(inventoryQty: 1, shoeSize: sizeList[3]),
            ProductWithSize(inventoryQty: 20, shoeSize: sizeList[4])
          ],
          productCollection: ProductCollection(
              collectionName: "Converse X Ader Error", brand: brandList[12]),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/converse-x-ader-error-chuck-70-high-white-1.jpg"),
          ]),
      Product(
          name: "Jordan 1 Retro Low OG Black Dark Powder Blue (UNC)",
          retailPrice: 4800,
          SKU: "CZ0790-104",
          colorway: "White/Dark Powder Blue",
          releaseDate: "25/07/2022",
          amountSold: 220,
          productWithSizes: [
            ProductWithSize(inventoryQty: 20, shoeSize: sizeList[8]),
            ProductWithSize(inventoryQty: 20, shoeSize: sizeList[9]),
            ProductWithSize(inventoryQty: 20, shoeSize: sizeList[10]),
            ProductWithSize(inventoryQty: 20, shoeSize: sizeList[11]),
            ProductWithSize(inventoryQty: 20, shoeSize: sizeList[12])
          ],
          productCollection: ProductCollection(
              collectionName: "Jordan 1", brand: brandList[2]),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-1-retro-low-og-unc-1.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-1-retro-low-og-unc-2.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-1-retro-low-og-unc-3.jpg"),
          ]),
      Product(
          name: "Jordan 3 Retro White Cement Reimagined",
          retailPrice: 7500,
          lastSalePrice: 6000,
          SKU: "DN3707-100",
          colorway: "SUMMIT WHITE/FIRE RED/BLACK/CEMENT GREY",
          releaseDate: "11/03/2023",
          amountSold: 142,
          productWithSizes: [
            ProductWithSize(inventoryQty: 2, shoeSize: sizeList[10]),
            ProductWithSize(inventoryQty: 5, shoeSize: sizeList[12]),
            ProductWithSize(inventoryQty: 2, shoeSize: sizeList[13]),
          ],
          productCollection: ProductCollection(
              collectionName: "Jordan 3", brand: brandList[2]),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-3-retro-white-cement-reimagined-1.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-3-retro-white-cement-reimagined-2.jpg"),
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-3-retro-white-cement-reimagined-3.jpg"),
          ]),
      Product(
          name: "Nike Air Force 1 Low '07",
          retailPrice: 1899,
          SKU: "CW2288-111",
          colorway: "---",
          releaseDate: "28/07/2023",
          amountSold: 2225,
          productWithSizes: [
            ProductWithSize(inventoryQty: 30, shoeSize: sizeList[0]),
            ProductWithSize(inventoryQty: 32, shoeSize: sizeList[1]),
            ProductWithSize(inventoryQty: 34, shoeSize: sizeList[2]),
            ProductWithSize(inventoryQty: 36, shoeSize: sizeList[3]),
            ProductWithSize(inventoryQty: 38, shoeSize: sizeList[4])
          ],
          productCollection: ProductCollection(
              collectionName: "Nike Air Force 1 ", brand: brandList[0]),
          productCat: ProductCat(catName: "Sneaker"),
          productImages: [
            ProductImage(
                productImageUrl:
                    "https://d2cva83hdk3bwc.cloudfront.net/nike-air-force-11e2yp-1.jpg"),
          ]),
    ];
  }
//======

//=== var: billList
  List<Bill> BillList = [];
  List<Bill> get billList => BillList;
  void setBilllist(List<Bill> billList) {
    BillList = billList;
    notifyListeners();
  } //ef

  // Method to initialize BillList using ProductList[0]
  // For Data Mocking
  void initializeBillList() {
    BillList = [
      Bill(
          orderDate: "16/12/2023",
          statusDate: "-",
          orderStatus: OrderStatus(statusName: "Pending"),
          deliveryReceiptPics: [
            DeliveryReceiptPic(picString: "url_ofThePic"),
            DeliveryReceiptPic(picString: "url_ofThePic"),
          ],
          storeBranch: StoreBranch(province: "Savannakhet"),
          customer: _customer,
          deliveryBranch: DeliveryBranch(
              deliveryService: DeliveryService(deliveryCompanyName: "TFT"),
              branchName: "saiyasone luangnamta",
              branchTelNumbers: [
                BranchTelNumber(telNumber: "4544984984984"),
                BranchTelNumber(telNumber: "4544984984984"),
              ],
              branchAvailability: "Open",
              branchAddress: BranchAddress(
                  province: "Savannalhet",
                  city: "poggerCity",
                  village: "Naruto village",
                  addressDetail: "Somewhere around the alley"),
              branchGooglemapPosition: "google map link"),
          shippingMethod: ShippingMethod(methodName: "In-store pick up"),
          billItems: [
            BillItem(
                qty: 20,
                shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 39.5),
                productCondition: ProductCondition(conditionName: "Brand new"),
                product: ProductList[0])
          ]),

      Bill(
          orderDate: "16/12/2023",
          statusDate: "-",
          orderStatus: OrderStatus(statusName: "Pending"),
          deliveryReceiptPics: [
            DeliveryReceiptPic(picString: "url_ofThePic"),
            DeliveryReceiptPic(picString: "url_ofThePic"),
          ],
          storeBranch: StoreBranch(province: "Savannakhet"),
          customer: _customer,
          deliveryBranch: DeliveryBranch(
              deliveryService: DeliveryService(deliveryCompanyName: "TFT"),
              branchName: "saiyasone luangnamta",
              branchTelNumbers: [
                BranchTelNumber(telNumber: "4544984984984"),
                BranchTelNumber(telNumber: "4544984984984"),
              ],
              branchAvailability: "Open",
              branchAddress: BranchAddress(
                  province: "Savannalhet",
                  city: "poggerCity",
                  village: "Naruto village",
                  addressDetail: "Somewhere around the alley"),
              branchGooglemapPosition: "google map link"),
          shippingMethod: ShippingMethod(methodName: "In-store pick up"),
          billItems: [
            BillItem(
                qty: 4,
                shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 39.5),
                productCondition: ProductCondition(conditionName: "Brand new"),
                product: ProductList[1]),
            BillItem(
                qty: 2,
                shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 40.5),
                productCondition: ProductCondition(conditionName: "Brand new"),
                product: ProductList[2])
          ]),
      Bill(
          orderDate: "16/12/2023",
          statusDate: "-",
          orderStatus: OrderStatus(statusName: "Shipping"),
          deliveryReceiptPics: [
            DeliveryReceiptPic(picString: "url_ofThePic"),
            DeliveryReceiptPic(picString: "url_ofThePic"),
          ],
          storeBranch: StoreBranch(province: "Savannakhet"),
          customer: _customer,
          deliveryBranch: DeliveryBranch(
              deliveryService: DeliveryService(deliveryCompanyName: "TFT"),
              branchName: "saiyasone luangnamta",
              branchTelNumbers: [
                BranchTelNumber(telNumber: "4544984984984"),
                BranchTelNumber(telNumber: "4544984984984"),
              ],
              branchAvailability: "Open",
              branchAddress: BranchAddress(
                  province: "Savannalhet",
                  city: "poggerCity",
                  village: "Naruto village",
                  addressDetail: "Somewhere around the alley"),
              branchGooglemapPosition: "google map link"),
          shippingMethod: ShippingMethod(methodName: "In-store pick up"),
          billItems: [
            BillItem(
                qty: 20,
                shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 39.5),
                productCondition: ProductCondition(conditionName: "Brand new"),
                product: ProductList[5]),
            BillItem(
                qty: 20,
                shoeSize: ShoeSize(sizeType: "EU", sizeNumber: 40),
                productCondition: ProductCondition(conditionName: "Defect"),
                product: ProductList[6]),
          ]),

      // Add more Bill instances as needed
    ];
  }
//======

  int Data1 = 0;
  int get data1 => Data1;
  void setData1(int data1) {
    Data1 = data1;
  } //ef

  //global app reference:
  GlobalKey<NavigatorState> app = GlobalKey<NavigatorState>();
} //ec
