-- SELECT * FROM  public.d_products;
ALTER TABLE public.d_products 
ADD COLUMN d_product_dimensions int8;

ALTER TABLE public.d_products
ADD CONSTRAINT fk_dimension_id
FOREIGN KEY (d_product_dimensions) 
REFERENCES public.d_product_dimensions (dimension_id);

UPDATE public.d_products
SET d_product_dimensions = (
    SELECT dimension_id
    FROM public.d_product_dimensions
    WHERE d_products.product_id = d_product_dimensions.product_id
); 

ALTER TABLE public.d_product_dimensions
DROP COLUMN category_id,
DROP COLUMN vendor_id,
DROP COLUMN name_product,
DROP COLUMN vendor_description,
DROP COLUMN product_id;


ALTER TABLE public.d_products
RENAME COLUMN d_product_dimensions TO dimension_id;