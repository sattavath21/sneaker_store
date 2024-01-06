import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/model/address.dart';
import 'package:sneaker_store_mobile_app/model/bank.dart';
import 'package:sneaker_store_mobile_app/model/bill.dart';
import 'package:sneaker_store_mobile_app/model/bill__item.dart';
import 'package:sneaker_store_mobile_app/model/branch__address.dart';
import 'package:sneaker_store_mobile_app/model/branch__tel__number.dart';
import 'package:sneaker_store_mobile_app/model/brand.dart';
import 'package:sneaker_store_mobile_app/model/customer.dart';
import 'package:sneaker_store_mobile_app/model/customer__addresse.dart';
import 'package:sneaker_store_mobile_app/model/customer__bank__account.dart';
import 'package:sneaker_store_mobile_app/model/customer__defect__image.dart';
import 'package:sneaker_store_mobile_app/model/customer__product__image.dart';
import 'package:sneaker_store_mobile_app/model/customer__wishlist.dart';
import 'package:sneaker_store_mobile_app/model/delivery__branch.dart';
import 'package:sneaker_store_mobile_app/model/delivery__receipt__pic.dart';
import 'package:sneaker_store_mobile_app/model/delivery__service.dart';
import 'package:sneaker_store_mobile_app/model/order__status.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/product__cat.dart';
import 'package:sneaker_store_mobile_app/model/product__collection.dart';
import 'package:sneaker_store_mobile_app/model/product__condition.dart';
import 'package:sneaker_store_mobile_app/model/product__image.dart';
import 'package:sneaker_store_mobile_app/model/product__selling.dart';
import 'package:sneaker_store_mobile_app/model/product__with__size.dart';
import 'package:sneaker_store_mobile_app/model/shipping__method.dart';
import 'package:sneaker_store_mobile_app/model/shoe__size.dart';
import 'package:sneaker_store_mobile_app/model/store__branch.dart';

class CentralStore extends ChangeNotifier {
  
  // TEST FOR GIT


  //=== var: customerList
  late Customer _customer;
  Customer get customer => _customer;
  void setCustomerlist(Customer customer) {
    _customer = customer;
    notifyListeners();
  } //ef

  void initializeCustomer() {
    _customer = Customer(first_name: "Sattavath", last_name: "Phitsavath", age: "22", vacation_mode: false, email_subscribtion: true, default_address: 0, customer_addresses: [
    Customer_addresse(address: Address(seller_name: "Construction store (Sattavath Phitsavath)", seller_tel_number: "0933860614", province: "Savannakhet", city: "Kaisone Phomvihane", village: "Phonesaiy Village", address_detail: "South street 191", post_code: "10001")),
    Customer_addresse(address: Address(seller_name: "My Home (Sattavath Phitsavath)", seller_tel_number: "0933860614", province: "Pakse", city: "Poupha City", village: "Somewhere Village", address_detail: "North street 898", post_code: "20001")),
  ], customer_bank_accounts: [
    Customer_bank_account(bank: Bank(bank_name: "SCB"), account_name: "Sattavath Phitsavath", account_number: "9115649876346", account_qr: "The Pic QR"),
    Customer_bank_account(bank: Bank(bank_name: "BCEL"), account_name: "ສັດຕະວັດ ພິດສະຫວາດ", account_number: "54649847321698", account_qr: "The Pic QR")
  ], customer_wishlists: [
    Customer_wishlist(shoe_size: Shoe_size(size_type: "EU", size_number: 36.5), product: productLists[2]),
    Customer_wishlist(shoe_size: Shoe_size(size_type: "EU", size_number: 37.5),product: productLists[5]),
    Customer_wishlist(shoe_size: Shoe_size(size_type: "EU", size_number: 38.5),product: productLists[1]),
    Customer_wishlist(shoe_size: Shoe_size(size_type: "EU", size_number: 39.5),product: productLists[8]),

  ], product_sellings: [
    Product_selling(
      qty: 3,
      shoe_size: Shoe_size(size_type: "EU", size_number: 36.5),
      product_live_date: "20/03/2020", 
      order_status: Order_status(status_name: "Pending"), 
      customer_placed_price: 4900, 
      product: productLists[0], 
      product_condition: Product_condition(condition_name: "Brand new"), product_defect: false, box_defect: false, customer_product_images: [
      Customer_product_image(product_image: "The Customer self-shot product image")
    ], customer_defect_images: [
      Customer_defect_image(defect_image: "The customr self-shot images")
    ]),
    Product_selling(
      qty: 10,
      shoe_size: Shoe_size(size_type: "EU", size_number: 36.5),
      product_live_date: "16/05/2020", 
      order_status: Order_status(status_name: "Active Ask"), 
      customer_placed_price: 12000, 
      product: productLists[1], 
      product_condition: Product_condition(condition_name: "Brand new"), product_defect: false, box_defect: false, customer_product_images: [
      Customer_product_image(product_image: "The Customer self-shot product image")
    ], customer_defect_images: [
      Customer_defect_image(defect_image: "The customr self-shot images")
    ]),
    Product_selling(
      qty: 1,
      shoe_size: Shoe_size(size_type: "EU", size_number: 36.5),
      product_live_date: "15/12/2020", 
      order_status: Order_status(status_name: "Pending"), 
      customer_placed_price: 6000, 
      product: productLists[2], 
      product_condition: Product_condition(condition_name: "Brand new"), product_defect: false, box_defect: false, customer_product_images: [
      Customer_product_image(product_image: "The Customer self-shot product image")
    ], customer_defect_images: [
      Customer_defect_image(defect_image: "The customr self-shot images")
    ]),
    Product_selling(
      qty: 2,
      shoe_size: Shoe_size(size_type: "EU", size_number: 36.5),
      product_live_date: "12/10/2020", 
      order_status: Order_status(status_name: "Shipment"), 
      customer_placed_price: 12000, 
      product: productLists[3], 
      product_condition: Product_condition(condition_name: "Brand new"), product_defect: false, box_defect: false, customer_product_images: [
      Customer_product_image(product_image: "The Customer self-shot product image")
    ], customer_defect_images: [
      Customer_defect_image(defect_image: "The customr self-shot images")
    ])
  ]);
  }
//======

  //=== var: buyingOrderStatusList
  List<Order_status> _buyingOrderStatusList = [
    Order_status(status_name: "Pending"),
    Order_status(status_name: "Processing"),
    Order_status(status_name: "Shipping"),
    Order_status(status_name: "Pending"),
    Order_status(status_name: "To Recieve"),
    Order_status(status_name: "Completed"),
    Order_status(status_name: "Canceled"),
    Order_status(status_name: "Return Refund"),
  ];
  List<Order_status> get buyingOrderStatusList => _buyingOrderStatusList;
  void setBuyingOrderstatuslist(List<Order_status> buyingOrderStatusList) {
    _buyingOrderStatusList = buyingOrderStatusList;
    notifyListeners();
  } //ef
//======

  //=== var: sizeList
  List<Shoe_size> _sizeList = [
    Shoe_size(size_type: "EU", size_number: 35.5),
    Shoe_size(size_type: "EU", size_number: 36),
    Shoe_size(size_type: "EU", size_number: 36.5),
    Shoe_size(size_type: "EU", size_number: 37),
    Shoe_size(size_type: "EU", size_number: 37.5),
    Shoe_size(size_type: "EU", size_number: 38),
    Shoe_size(size_type: "EU", size_number: 38.5),
    Shoe_size(size_type: "EU", size_number: 39),
    Shoe_size(size_type: "EU", size_number: 39.5),
    Shoe_size(size_type: "EU", size_number: 40),
    Shoe_size(size_type: "EU", size_number: 40.5),
    Shoe_size(size_type: "EU", size_number: 41),
    Shoe_size(size_type: "EU", size_number: 41.5),
    Shoe_size(size_type: "EU", size_number: 42),
    Shoe_size(size_type: "EU", size_number: 42.5),
    Shoe_size(size_type: "EU", size_number: 43),
    Shoe_size(size_type: "EU", size_number: 43.5),
    Shoe_size(size_type: "EU", size_number: 44),
    Shoe_size(size_type: "EU", size_number: 44.5),
    Shoe_size(size_type: "EU", size_number: 45),
    Shoe_size(size_type: "EU", size_number: 45.5),
    Shoe_size(size_type: "EU", size_number: 46),
    Shoe_size(size_type: "EU", size_number: 46.5),
    Shoe_size(size_type: "EU", size_number: 47)
  ];
  List<Shoe_size> get sizeList => _sizeList;
  void setSizelist(List<Shoe_size> sizeList) {
    _sizeList = sizeList;
    notifyListeners();
  } //ef
//======

  //=== var: recentProductList
  List<Product> _recentProductList = [
  
  ];
  List<Product> get recentProductList => _recentProductList;
  void setRecentproductlist(List<Product> recentProductList) {
    _recentProductList = recentProductList;
    notifyListeners();
  } //ef

  void appendRecentProduct(Product product) {
    _recentProductList.add(product);
  }

  void initializeRecentProductList(){
    _recentProductList = [
      productLists[0],
      productLists[1],
      productLists[2],
      productLists[5],
    ];
  }
//======

  //=== var: brandList
  List<Brand> _brandList = [
    Brand(
        brand_name: "Nike",
        brand_logo:
            "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png"),
    Brand(
        brand_name: "Gucci",
        brand_logo:
            "https://www.freeiconspng.com/thumbs/gucci-logo/gg-hd-transparent-logo-15.png"),
    Brand(
        brand_name: "Jordan",
        brand_logo:
            "https://cdn.freebiesupply.com/images/large/2x/air-jordan-logo-png-transparent.png"),
    Brand(
        brand_name: "New Balance",
        brand_logo:
            "https://seeklogo.com/images/N/new-balance-logo-92A821DDB4-seeklogo.com.png"),
    Brand(
        brand_name: "Asics",
        brand_logo:
            "https://companieslogo.com/img/orig/7936.T.D-8cfad757.png?t=1685353412"),
    Brand(
        brand_name: "Fear of God",
        brand_logo:
            "https://i.pinimg.com/originals/ea/83/71/ea837126c830a6b78e1ebc0fff313df0.png"),
    Brand(
        brand_name: "Stussy",
        brand_logo:
            "https://assets.stickpng.com/images/61fa8e24eec4c40004bacd50.png"),
    Brand(
        brand_name: "Puma",
        brand_logo:
            "https://seeklogo.com/images/P/puma-logo-F9E13B654C-seeklogo.com.png"),
    Brand(
        brand_name: "Salomon",
        brand_logo:
            "https://assets.stickpng.com/images/6011b1291b7ff00004506b3e.png"),
    Brand(
        brand_name: "Chanel",
        brand_logo:
            "https://assets.stickpng.com/images/61336a2c82b156000425b39f.png"),
    Brand(
        brand_name: "Reebok",
        brand_logo:
            "https://cdn.iconscout.com/icon/free/png-256/free-reebok-crossfit-3421601-2854282.png"),
    Brand(
        brand_name: "Converse",
        brand_logo:
            "https://brandslogos.com/wp-content/uploads/images/large/converse-logo-1.png"),
    Brand(
        brand_name: "Vans",
        brand_logo:
            "https://assets.stickpng.com/images/5842f005a6515b1e0ad75b0f.png"),
    Brand(
        brand_name: "Hoka",
        brand_logo:
            "https://cdn.aboutstatic.com/file/591c57b865903b747f8c871dac4d6510.png?quality=75&transparent=1&trim=1&height=480&width=360"),
  ];
  List<Brand> get brandList => _brandList;
  void setBrandlist(List<Brand> brandList) {
    _brandList = brandList;
    notifyListeners();
  } //ef

//======

//=== var: mostPopularProductList
  List<Product> _mostPopularProductList = [
    Product(
        name: "Nike Air Force 1 Low '07",
        store_price: 1899,
        SKU: "CW2288-111",
        colorway: "---",
        release_date: "28/07/2023",
        amount_sold: 2184,
        product_with_sizes: [
           Product_with_size(inventory_qty: 11, shoe_size: Shoe_size( size_type: "EU", size_number: 34.5),
          ),
          Product_with_size(inventory_qty: 21, shoe_size: Shoe_size( size_type: "EU", size_number: 24.5),
          ),
          Product_with_size(inventory_qty: 31, shoe_size: Shoe_size( size_type: "EU", size_number: 35),
          ),
          Product_with_size(inventory_qty: 23, shoe_size: Shoe_size( size_type: "EU", size_number: 35.5),
          ),
          Product_with_size(inventory_qty: 22, shoe_size: Shoe_size( size_type: "EU", size_number: 36),
          ),
        ],
        product_collection: Product_collection(
            collection_name: "Nike Air Force 1",
            brand: Brand(
                brand_name: "Nike",
                brand_logo:
                    "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png")),
        product_cat: Product_cat(cat_name: "Sneaker"),
        product_images: [
          Product_image(
              product_image_url:
                  "https://d2cva83hdk3bwc.cloudfront.net/nike-air-force-11e2yp-1.jpg"),
        ]),
        Product(
        name: "Adidas Samba OG Black White Gum",
        store_price: 2999,
        SKU: "B75807-BZ0058",
        colorway: "Black White Gum",
        release_date: "---",
        amount_sold: 538,
        product_with_sizes: [
          Product_with_size(inventory_qty: 11, shoe_size: Shoe_size( size_type: "EU", size_number: 34.5),
          ),
          Product_with_size(inventory_qty: 21, shoe_size: Shoe_size( size_type: "EU", size_number: 24.5),
          ),
          Product_with_size(inventory_qty: 31, shoe_size: Shoe_size( size_type: "EU", size_number: 35),
          ),
          Product_with_size(inventory_qty: 23, shoe_size: Shoe_size( size_type: "EU", size_number: 35.5),
          ),
          Product_with_size(inventory_qty: 22, shoe_size: Shoe_size( size_type: "EU", size_number: 36),
          ),
        ],
        product_collection: Product_collection(
            collection_name: "Adidas Samba",
            brand: Brand(
                brand_name: "Adidas",
                brand_logo:
                    "https://logodownload.org/wp-content/uploads/2014/07/adidas-logo-0.png")),
        product_cat: Product_cat(cat_name: "Sneaker"),
        product_images: [
          Product_image(
              product_image_url:
                  "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg"),
          Product_image(
              product_image_url:
                  "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-2.jpg"),
          Product_image(
              product_image_url:
                  "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-3.jpg"),
        ]),
        Product(
        name: "New Balance 530 White Silver Navy",
        store_price: 1990,
        SKU: "MR530SG",
        colorway: "White Silver Navy",
        release_date: "---",
        amount_sold: 8093,
        product_with_sizes: [
           Product_with_size(inventory_qty: 11, shoe_size: Shoe_size( size_type: "EU", size_number: 34.5),
          ),
          Product_with_size(inventory_qty: 21, shoe_size: Shoe_size( size_type: "EU", size_number: 24.5),
          ),
          Product_with_size(inventory_qty: 31, shoe_size: Shoe_size( size_type: "EU", size_number: 35),
          ),
          Product_with_size(inventory_qty: 23, shoe_size: Shoe_size( size_type: "EU", size_number: 35.5),
          ),
          Product_with_size(inventory_qty: 22, shoe_size: Shoe_size( size_type: "EU", size_number: 36),
          ),
        ],
        product_collection: Product_collection(
            collection_name: "New Balance 530",
            brand: Brand(
                brand_name: "New Balance",
                brand_logo:
                    "https://seeklogo.com/images/N/new-balance-logo-92A821DDB4-seeklogo.com.png")),
        product_cat: Product_cat(cat_name: "Sneaker"),
        product_images: [
          Product_image(
              product_image_url:
                  "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-1.jpg"),
          Product_image(
              product_image_url:
                  "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-2.jpg"),
          Product_image(
              product_image_url:
                  "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-3.jpg"),
        ])
  ];
  List<Product> get mostPopularProductList => _mostPopularProductList;
  void setMostPopularProductList(List<Product> mostPopularProductList) {
    _mostPopularProductList = mostPopularProductList;
    notifyListeners();
  } //ef

  void appendMostPopularProductList(Product product){
    _mostPopularProductList.add(product);
  }
//======

  //=== var: productLists
  List<Product> _productList = [];
  List<Product> get productLists => _productList;
  void setProductlists(List<Product> productLists) {
    _productList = productLists;
    notifyListeners();
  } //ef

  void initializeProductList() {
    _productList = [
      Product(
          name: "New Balance 530 White Silver Navy",
          store_price: 1990,
          SKU: "MR530SG",
          colorway: "White Silver Navy",
          release_date: "---",
          amount_sold: 8093,
          product_with_sizes: [
            Product_with_size(inventory_qty: 21, shoe_size: _sizeList[0]),
            Product_with_size(inventory_qty: 11, shoe_size: _sizeList[1]),
            Product_with_size(inventory_qty: 31, shoe_size: _sizeList[2]),
            Product_with_size(inventory_qty: 23, shoe_size: _sizeList[3]),
            Product_with_size(inventory_qty: 22, shoe_size: _sizeList[4])
          ],
          product_collection: Product_collection(
              collection_name: "New Balance 530",
              brand: Brand(
                  brand_name: "New Balance",
                  brand_logo:
                      "https://seeklogo.com/images/N/new-balance-logo-92A821DDB4-seeklogo.com.png")),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-1.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-2.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/new-balance-530-white-silver-navy-3.jpg"),
          ]),
      Product(
          name: "Nike Air Force 1 Low '07",
          store_price: 1899,
          lowest_selling_price: 1000,
          SKU: "CW2288-111",
          colorway: "---",
          release_date: "28/07/2023",
          amount_sold: 2184,
          product_with_sizes: [
            Product_with_size(inventory_qty: 21, shoe_size: sizeList[5]),
            Product_with_size(inventory_qty: 11, shoe_size: sizeList[6]),
            Product_with_size(inventory_qty: 31, shoe_size: sizeList[7]),
            Product_with_size(inventory_qty: 23, shoe_size: sizeList[8]),
            Product_with_size(inventory_qty: 22, shoe_size: sizeList[9])
          ],
          product_collection: Product_collection(
              collection_name: "Nike Air Force 1",
              brand: Brand(
                  brand_name: "Nike",
                  brand_logo:
                      "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png")),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/nike-air-force-11e2yp-1.jpg"),
          ]),
      Product(
          name: "Adidas Samba OG Black White Gum",
          store_price: 2999,
          lowest_selling_price: 2000,
          SKU: "B75807-BZ0058",
          colorway: "Black White Gum",
          release_date: "---",
          amount_sold: 538,
          product_with_sizes: [
            Product_with_size(inventory_qty: 15, shoe_size: sizeList[0]),
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[2]),
            Product_with_size(inventory_qty: 2, shoe_size: sizeList[4]),
            Product_with_size(inventory_qty: 1, shoe_size: sizeList[6]),
            Product_with_size(inventory_qty: 20, shoe_size: sizeList[8])
          ],
          product_collection: Product_collection(
              collection_name: "Adidas Samba",
              brand: Brand(
                  brand_name: "Adidas",
                  brand_logo:
                      "https://logodownload.org/wp-content/uploads/2014/07/adidas-logo-0.png")),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-2.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-3.jpg"),
          ]),
      Product(
          name: "Puma X Juun.J Plexus Black",
          store_price: 5000,
          SKU: "391697-01",
          colorway: "---",
          release_date: "07/04/2023",
          amount_sold: 0,
          product_with_sizes: [
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[0]),
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[2]),
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[3]),
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[5]),
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[7])
          ],
          product_collection: Product_collection(
              collection_name: "Puma X Juun.J", brand: brandList[7]),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/puma-x-juun.j-plexus-black-2.jpg"),
          ]),
      Product(
          name: "Gucci X Disney Mickey Mouse (W)",
          store_price: 9900,
          SKU: "602129-AYO70-9591",
          colorway: "Ivory/Orange/Multicolor",
          release_date: "---",
          amount_sold: 0,
          product_with_sizes: [
            Product_with_size(inventory_qty: 1, shoe_size: sizeList[0]),
            Product_with_size(inventory_qty: 1, shoe_size: sizeList[1]),
            Product_with_size(inventory_qty: 1, shoe_size: sizeList[2]),
            Product_with_size(inventory_qty: 1, shoe_size: sizeList[3]),
          ],
          product_collection: Product_collection(
              collection_name: "Gucci X Disney", brand: brandList[2]),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/gucci-x-disney-mickey-mouse--w--1.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/gucci-x-disney-mickey-mouse--w--2.jpg")
          ]),
      Product(
          name: "Golden Goose Yeah Leather Sneakers Gold Laminated (W)",
          store_price: 16700,
          lowest_selling_price: 10000,
          SKU: "GWF00130-F002196-65121",
          colorway: "Gold Laminated",
          release_date: "---",
          amount_sold: 0,
          product_with_sizes: [
            Product_with_size(inventory_qty: 2, shoe_size: sizeList[0]),
          ],
          product_collection: Product_collection(
              collection_name: "Golden Goose Yeah Leather",
              brand: Brand(
                  brand_name: "Golden Goose",
                  brand_logo:
                      "https://seeklogo.com/images/G/golden-goose-logo-0E4DBCFBE7-seeklogo.com.png")),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/golden-goose-yeah-leather-sneakers-gold-laminated--w--1.jpg"),
          ]),
      Product(
          name: "Converse X Ader Error Chuck 70 High White",
          store_price: 6590,
          SKU: "A05351C",
          colorway: "---",
          release_date: "28/07/2023",
          amount_sold: 4,
          product_with_sizes: [
            Product_with_size(inventory_qty: 15, shoe_size: sizeList[0]),
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[1]),
            Product_with_size(inventory_qty: 2, shoe_size: sizeList[2]),
            Product_with_size(inventory_qty: 1, shoe_size: sizeList[3]),
            Product_with_size(inventory_qty: 20, shoe_size: sizeList[4])
          ],
          product_collection: Product_collection(
              collection_name: "Converse X Ader Error", brand: brandList[12]),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/converse-x-ader-error-chuck-70-high-white-1.jpg"),
          ]),
      Product(
          name: "Jordan 1 Retro Low OG Black Dark Powder Blue (UNC)",
          store_price: 4800,
          SKU: "CZ0790-104",
          colorway: "White/Dark Powder Blue",
          release_date: "25/07/2022",
          amount_sold: 220,
          product_with_sizes: [
            Product_with_size(inventory_qty: 20, shoe_size: sizeList[8]),
            Product_with_size(inventory_qty: 20, shoe_size: sizeList[9]),
            Product_with_size(inventory_qty: 20, shoe_size: sizeList[10]),
            Product_with_size(inventory_qty: 20, shoe_size: sizeList[11]),
            Product_with_size(inventory_qty: 20, shoe_size: sizeList[12])
          ],
          product_collection: Product_collection(
              collection_name: "Jordan 1", brand: brandList[2]),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-1-retro-low-og-unc-1.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-1-retro-low-og-unc-2.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-1-retro-low-og-unc-3.jpg"),
          ]),
      Product(
          name: "Jordan 3 Retro White Cement Reimagined",
          store_price: 7500,
          lowest_selling_price: 6000,
          SKU: "DN3707-100",
          colorway: "SUMMIT WHITE/FIRE RED/BLACK/CEMENT GREY",
          release_date: "11/03/2023",
          amount_sold: 142,
          product_with_sizes: [
            Product_with_size(inventory_qty: 2, shoe_size: sizeList[10]),
            Product_with_size(inventory_qty: 5, shoe_size: sizeList[12]),
            Product_with_size(inventory_qty: 2, shoe_size: sizeList[13]),
          ],
          product_collection: Product_collection(
              collection_name: "Jordan 3", brand: brandList[2]),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-3-retro-white-cement-reimagined-1.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-3-retro-white-cement-reimagined-2.jpg"),
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/jordan-3-retro-white-cement-reimagined-3.jpg"),
          ]),
      Product(
          name: "Nike Air Force 1 Low '07",
          store_price: 1899,
          SKU: "CW2288-111",
          colorway: "---",
          release_date: "28/07/2023",
          amount_sold: 2225,
          product_with_sizes: [
            Product_with_size(inventory_qty: 30, shoe_size: sizeList[0]),
            Product_with_size(inventory_qty: 32, shoe_size: sizeList[1]),
            Product_with_size(inventory_qty: 34, shoe_size: sizeList[2]),
            Product_with_size(inventory_qty: 36, shoe_size: sizeList[3]),
            Product_with_size(inventory_qty: 38, shoe_size: sizeList[4])
          ],
          product_collection: Product_collection(
              collection_name: "Nike Air Force 1 ", brand: brandList[0]),
          product_cat: Product_cat(cat_name: "Sneaker"),
          product_images: [
            Product_image(
                product_image_url:
                    "https://d2cva83hdk3bwc.cloudfront.net/nike-air-force-11e2yp-1.jpg"),
          ]),
    ];
  }
//======

//=== var: billList
  List<Bill> _billList = [];
  List<Bill> get billList => _billList;
  void setBilllist(List<Bill> billList) {
    _billList = billList;
    notifyListeners();
  } //ef

  // Method to initialize _billList using _productList[0]
  // For Data Mocking
  void initializeBillList() {
    _billList = [
      Bill(
          order_date: "16/12/2023",
          status_date: "-",
          order_status: Order_status(status_name: "Pending"),
          delivery_receipt_pics: [
            Delivery_receipt_pic(pic_string: "url_of_the_pic"),
            Delivery_receipt_pic(pic_string: "url_of_the_pic"),
          ],
          store_branch: Store_branch(province: "Savannakhet"),
          customer: _customer,
          delivery_branch: Delivery_branch(
              delivery_service: Delivery_service(delivery_company_name: "TFT"),
              branch_name: "saiyasone luangnamta",
              branch_tel_numbers: [
                Branch_tel_number(tel_number: "4544984984984"),
                Branch_tel_number(tel_number: "4544984984984"),
              ],
              branch_availability: "Open",
              branch_address: Branch_address(
                  province: "Savannalhet",
                  city: "pogger_city",
                  village: "Naruto village",
                  address_detail: "Somewhere around the alley"),
              branch_googlemap_position: "google map link"),
          shipping_method: Shipping_method(method_name: "In-store pick up"),
          bill_items: [
            Bill_item(
                qty: 20,
                shoe_size: Shoe_size(size_type: "EU", size_number: 39.5),
                product_condition:
                    Product_condition(condition_name: "Brand new"),
                product: _productList[0])
          ]),

      Bill(
          order_date: "16/12/2023",
          status_date: "-",
          order_status: Order_status(status_name: "Pending"),
          delivery_receipt_pics: [
            Delivery_receipt_pic(pic_string: "url_of_the_pic"),
            Delivery_receipt_pic(pic_string: "url_of_the_pic"),
          ],
          store_branch: Store_branch(province: "Savannakhet"),
          customer: _customer,
          delivery_branch: Delivery_branch(
              delivery_service: Delivery_service(delivery_company_name: "TFT"),
              branch_name: "saiyasone luangnamta",
              branch_tel_numbers: [
                Branch_tel_number(tel_number: "4544984984984"),
                Branch_tel_number(tel_number: "4544984984984"),
              ],
              branch_availability: "Open",
              branch_address: Branch_address(
                  province: "Savannalhet",
                  city: "pogger_city",
                  village: "Naruto village",
                  address_detail: "Somewhere around the alley"),
              branch_googlemap_position: "google map link"),
          shipping_method: Shipping_method(method_name: "In-store pick up"),
          bill_items: [
            Bill_item(
                qty: 4,
                shoe_size: Shoe_size(size_type: "EU", size_number: 39.5),
                product_condition:
                    Product_condition(condition_name: "Brand new"),
                product: _productList[1]),
                Bill_item(
                qty: 2,
                shoe_size: Shoe_size(size_type: "EU", size_number: 40.5),
                product_condition:
                    Product_condition(condition_name: "Brand new"),
                product: _productList[2])
          ]),
      Bill(
          order_date: "16/12/2023",
          status_date: "-",
          order_status: Order_status(status_name: "Shipping"),
          delivery_receipt_pics: [
            Delivery_receipt_pic(pic_string: "url_of_the_pic"),
            Delivery_receipt_pic(pic_string: "url_of_the_pic"),
          ],
          store_branch: Store_branch(province: "Savannakhet"),
          customer: _customer,
          delivery_branch: Delivery_branch(
              delivery_service: Delivery_service(delivery_company_name: "TFT"),
              branch_name: "saiyasone luangnamta",
              branch_tel_numbers: [
                Branch_tel_number(tel_number: "4544984984984"),
                Branch_tel_number(tel_number: "4544984984984"),
              ],
              branch_availability: "Open",
              branch_address: Branch_address(
                  province: "Savannalhet",
                  city: "pogger_city",
                  village: "Naruto village",
                  address_detail: "Somewhere around the alley"),
              branch_googlemap_position: "google map link"),
          shipping_method: Shipping_method(method_name: "In-store pick up"),
          bill_items: [
            Bill_item(
                qty: 20,
                shoe_size: Shoe_size(size_type: "EU", size_number: 39.5),
                product_condition:
                    Product_condition(condition_name: "Brand new"),
                product: _productList[5]),
            Bill_item(
                qty: 20,
                shoe_size: Shoe_size(size_type: "EU", size_number: 40),
                product_condition:
                    Product_condition(condition_name: "Defect"),
                product: _productList[6]),
          ]),

      // Add more Bill instances as needed
    ];
  }
//======

  int _data1 = 0;
  int get data1 => _data1;
  void setData1(int data1) {
    _data1 = data1;
  } //ef

  //global app reference:
  GlobalKey<NavigatorState> app = GlobalKey<NavigatorState>();
} //ec
