import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/shared/snackbar.dart';
import 'package:store/widgets/custom_elevated_button.dart';
import 'package:store/widgets/custom_text_from_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({
    super.key,
  });

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, des, image;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Update Product",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFromField(
                onChanged: (data) {
                  productName = data;
                },
                obscureText: false,
                hintText: "Product Name",
              ),
              const SizedBox(height: 15),
              CustomTextFromField(
                onChanged: (data) {
                  des = data;
                },
                obscureText: false,
                hintText: "Describtion",
              ),
              const SizedBox(height: 15),
              CustomTextFromField(
                onChanged: (data) {
                  price = data;
                },
                obscureText: false,
                hintText: "Price",
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              CustomTextFromField(
                onChanged: (data) {
                  image = data;
                },
                obscureText: false,
                hintText: "Image Url",
              ),
              const SizedBox(height: 50),
              CustomElevatedButton(
                onPressed: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await UpdateProductService().updateProduct(
                        title:
                            productName == null ? product.title : productName!,
                        price: price == null ? product.price : price!,
                        des: des == null ? product.description : des!,
                        image: image == null ? product.image : image!,
                        id: product.id,
                        category: product.category);
                    if (!mounted) return;
                    showSnackBar(context, "Product updated successfully");
                  } catch (e) {
                    showSnackBar(context, e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                horizontal: 120,
                vertical: 18,
                circular: 15,
                color: Colors.blue,
                title: 'Update',
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
