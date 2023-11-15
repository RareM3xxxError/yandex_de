ALTER TABLE public.d_products 
ADD COLUMN dimension_id int8;

ALTER TABLE public.d_products
ADD CONSTRAINT fk_dimension_id
FOREIGN KEY (dimension_id) 
REFERENCES public.d_product_dimensions (dimension_id);

UPDATE public.d_products
SET dimension_id = (
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
