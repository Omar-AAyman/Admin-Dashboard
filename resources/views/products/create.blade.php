@extends('layouts.main')
@section('title', 'Create Product')
@section('css')

@endsection
@section('content')
    <!-- general form elements -->
    <div class="card col-12 card-primary">
        <div class="card-header">
            <h3 class="card-title">@yield('title')</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <form action="{{ route('dashboard.products.store') }}" method="post">
            <div class="card-body">
                <div class="form-row my-3">
                    <div class="col-6">
                        <label for="name_en">English Name</label>
                        <input type="text" class="form-control" id="name_en" name="name_en"
                            placeholder="Enter product's name in EN">
                    </div>
                    <div class="col-6">
                        <label for="name_ar">Arabic Name</label>
                        <input type="text" class="form-control" id="name_ar" name="name_ar"
                            placeholder="Enter product's name in AR">
                    </div>
                </div>
                <div class="form-row my-3">
                    <div class="col-4">
                        <label for="code">Product's Code</label>
                        <input type="text" class="form-control" id="code" name="code"
                            placeholder="Enter product's unique code">
                    </div>
                    <div class="col-4">
                        <label for="quantity">Quantity</label>
                        <input type="text" class="form-control" id="quantity" name="quantity"
                            placeholder="Enter product's available quantity">
                    </div>
                    <div class="col-4">
                        <label for="price">Price</label>
                        <input type="text" class="form-control" id="price" name="price"
                            placeholder="Enter product's price">
                    </div>
                </div>
                <div class="form-row my-3">
                    <div class="col-4">
                        <label for="status">Status</label>
                        <select name="status" id="status" class="form-control">
                            @foreach ($statuses as $value => $status)
                                <option value="{{ $value }}">{{ $status }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="brands">Brands</label>
                        <select name="brand_id" id="brand_id" class="form-control">
                            <option value="">No Brand</option>
                            @foreach ($brands as $brand)
                                <option value="{{ $brand->id }}">{{ $brand->name_en . '-' . $brand->name_ar }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="sub_categorie_id">Sub Catrogries</label>
                        <select name="sub_categorie_id" id="sub_categorie_id" class="form-control">
                            @foreach ($sub_categories as $sub_category)
                                <option value="{{ $sub_category->id }}">
                                    {{ $sub_category->name_en . '-' . $sub_category->name_ar }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="form-row my-3">
                    <div class="col-6">
                        <label for="desc_en">Details In English</label>
                        <textarea name="desc_en" id="desc_en" class="form-control" cols="30" rows="10"></textarea>
                    </div>
                    <div class="col-6">
                        <label for="desc_ar">Details In Arabic</label>
                        <textarea name="desc_ar" id="desc_ar" class="form-control" cols="30" rows="10"></textarea>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-2">
                        <label for="upload" >
                        <img class="w-50"  src="{{ asset('assets/images/3616929.png') }}" style="cursor: pointer" >
                    </label>
                    <input type="file" name="upload" id="upload" class="d-none">
                    </div>
                </div>

            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button type="button" class="btn btn-primary  rounded">Create</button>
                <button type="button" class="btn btn-success  rounded">Create & Return Back</button>
            </div>
        </form>
    </div>
    <!-- /.card -->
@endsection


@section('scripts')
@endsection
