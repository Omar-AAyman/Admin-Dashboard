<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;

class ProductController extends Controller
{
    public const STATUSES = ['Not Active', 'Active'];
    public const MAX_UPLOAD_SIZE = 1024;  //1024kb
    public const AVAILABLE_EXTENSIONS = ['png', 'jpg', 'jpeg'];
    public function index(Request $request)
    {

        //Get product's data from DB
        $products = DB::table('products')->get();

        //Check if request wants a JSON file.. 
        if ($request->wantsJson()) {
            return response()->json(compact('products'));
        }
        //Return ('products.index')'s view with 'products'. to view all products there!
        return view('products.index', compact('products'));
    }
    public function create(Request $request)
    {
        //Get all brands IDs and arabic and english names from DB
        $brands = DB::table('brands')->select('id', 'name_en', 'name_ar')->get();

        //Get all Sub_categories IDs and arabic and english names from DB
        $sub_categories = DB::table('sub_categories')->select('id', 'name_en', 'name_ar')->get();

        //Check if request wants a JSON file.. 
        if ($request->wantsJson()) {
            return response()->json(compact('brands', 'sub_categories'));
        }

        //Return ('products.create')'s view with 'brands', 'sub_categories' ,'statuses'. to create a new Item there!
        return view('products.create', compact('brands', 'sub_categories'))->with('statuses', self::STATUSES);
    }
    public function store(Request $request)
    {

        //Validation rules
        $request->validate(
            [

                'name_en' => ['required', 'string', 'max:32'],
                'name_ar' => ['required', 'string', 'max:32'],
                'price' => ['required', 'numeric', 'between:1,999999.99'],
                'quantity' => ['nullable', 'integer', 'between:1,99'],
                'code' => ['required', 'integer', 'max:1000000', 'unique:products'],
                'status' => ['nullable', 'in: ' . implode(',', array_keys(ProductController::STATUSES))],
                'brand_id' => ['nullable', 'integer', 'exists:brands,id'],
                'sub_category_id' => ['required', 'integer', 'exists:sub_categories,id'],
                'desc_en' => ['required', 'string'],
                'desc_ar' => ['required', 'string'],
                'image' => ['required', 'max:' . ProductController::MAX_UPLOAD_SIZE, 'mimes:' . implode(',', ProductController::AVAILABLE_EXTENSIONS)],

            ]
        );

        // Add these attributes's values  only into $data var
        $data = $request->only('name_en', 'name_ar', 'price', 'quantity', 'code', 'status', 'brand_id', 'sub_category_id', 'desc_ar', 'desc_en');

        //generate image's hashed name
        $photoName = $request->file('image')->hashName();

        //Store hashed image's name into $data['image'] var
        $data['image'] = $photoName;

        //Move the image to be stored in images /products folder
        $request->file('image')->move(public_path('assets/images/products'), $photoName);

        // dd($data);

        //Store
        DB::table('products')->insert($data);

        //Check if request wants a JSON file.. 
        if ($request->wantsJson()) {
            return response()->json(['success' => true, 'msg' => 'Product has been Created Successfully'], 201);
        }

        if ($request->has('redirect') && $request['redirect'] == 'index') {

            // If user chooses (Create) will be Redirected back to All products page with a flash message ('Success')
            return redirect()->route('dashboard.products.index')->with('success', 'Product has been Created Successfully');
        } else {


            // If user chooses (Create & Return back option) will be Redirected back to Create Product page with a flash message ('Success')
            return redirect()->back()->with('success', 'Product has been Created Successfully');
        };
    }

    //Update
    public function edit(Request $request, $id)
    {
        //Get product's object from DB
        $product = DB::table('products')->where('id', $id)->first();

        //Get all brands IDs and arabic and english names from DB
        $brands = DB::table('brands')->select('id', 'name_en', 'name_ar')->get();

        //Get all Sub_categories IDs and arabic and english names from DB
        $sub_categories = DB::table('sub_categories')->select('id', 'name_en', 'name_ar')->get();



        //Check if request wants a JSON file.. 
        if ($request->wantsJson()) {
            return response()->json(compact('product', 'brands', 'sub_categories'));
        }
        //Return ('products.edit')'s view with 'product', 'brands', 'sub_categories' ,'statuses'.
        return view('products.edit', compact('product', 'brands', 'sub_categories'))->with('statuses', self::STATUSES);
    }
    public function update(Request $request, $id)
    {



        // Validation
        $data = $request->validate(
            [
                'name_en' => ['required', 'string', 'max:32'],
                'name_ar' => ['required', 'string', 'max:32'],
                'price' => ['required', 'numeric', 'between:1,999999.99'],
                'quantity' => ['required', 'integer', 'between:1,99'],
                'code' => ['required', 'integer', 'max:1000000', 'unique:products,code,' . $id . ',id'],
                'status' => ['required', 'in: ' . implode(',', array_keys(ProductController::STATUSES))],
                'brand_id' => ['nullable', 'integer', 'exists:brands,id'],
                'sub_category_id' => ['required', 'integer', 'exists:sub_categories,id'],
                'desc_en' => ['required', 'string'],
                'desc_ar' => ['required', 'string'],
                'image' => ['nullable', 'max:' . ProductController::MAX_UPLOAD_SIZE, 'mimes:' . implode(',', ProductController::AVAILABLE_EXTENSIONS)],
            ]
        );

        // Add these attributes's values  only into $data var
        $data = $request->only('name_en', 'name_ar', 'price', 'quantity', 'code', 'status', 'brand_id', 'sub_category_id', 'desc_ar', 'desc_en');


        if ($request->hasFile('image')) {
            //generate image's hashed name
            $photoName = $request->file('image')->hashName();

            //Store hashed image's name into $data['image'] var
            $data['image'] = $photoName;

            //Move the image to be stored in images /products folder
            $request->file('image')->move(public_path('assets/images/products'), $photoName);

            //Get product's object from DB
            $product = DB::table('products')->where('id', $id)->first();

            //Check if the item has a photo to remove
            if (file_exists(public_path('assets/images/products/' . $product->image))) {
                unlink(public_path('assets/images/products/' . $product->image));
            };

            //update the data
            DB::table('products')->where('id', $id)->update($data);
        };

        //Check if request wants a JSON file.. 
        if ($request->wantsJson()) {
            return response()->json(['success' => true, 'msg' => 'Product has been Updated Successfully'], 200);
        }

        // If user chooses (UPDATE) will be Redirected to all products page with a flash message ('Success') after updating this product successfully
        if ($request->has('redirect') && $request['redirect'] == 'index') {

            // If user chooses (UPDATE) will be Redirected to all products page with a flash message ('Success')
            return redirect()->route('dashboard.products.index')->with('success', 'The Product has been Updated Successfully');
        } else {

            // If user chooses (CANCEL) will be Redirected to all products without doing anything. 
            return redirect()->route('dashboard.products.index');
        };
    }

    public function destroy(Request $request, $id)
    {
        //Get product's object from DB
        $product = DB::table('products')->where('id', $id)->first();

        //Check if the item has a photo to remove
        if (file_exists(public_path('assets/images/products/' . $product->image))) {
            unlink(public_path('assets/images/products/' . $product->image));
        };

        //update the data
        DB::table('products')->where('id', $id)->delete();


        if ($request->wantsJson()) {
            return response()->json(['success' => true, 'msg' => 'Product has been Deleted Successfully'], 200);
        }
        // Delete the product and be Redirected back to all products page with a flash message ('Success')
        return redirect()->back()->with('success', 'The Product has been Deleted Successfully');
    }
}
