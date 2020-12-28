package com.hklmart.service;

import com.hklmart.domain.ProductModifyDTO;
import com.hklmart.domain.ProductVO;
import com.hklmart.domain.RegistImageVO;
import com.hklmart.domain.StockVO;
import com.hklmart.persistence.ProductDAO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Log4j
@Service
public class FileService {

    private final ProductDAO product;

    public FileService(ProductDAO product) {
        this.product = product;
    }

    public String getFolderPath(String absolutePath) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String datePath = sdf.format(date).replace("-", File.separator);
        String path = absolutePath + "\\" + datePath;
        return path;
    }

    public void saveFile(HttpServletRequest request, ProductVO productVO, RegistImageVO imageVO, StockVO stockVO) throws IllegalStateException, IOException {
        String mainImageName = UUID.randomUUID().toString() + "_" + imageVO.getUploadImg().getOriginalFilename();
        File path = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/product")));
        File contextPath = new File(getFolderPath(request.getSession().getServletContext().getContextPath() + "/resources/product"));
        File image = new File(path + "\\M_" + mainImageName);
        File thumbnail = new File(path + "\\S_" + mainImageName);
        File contentImage = new File(path + "\\C_" + mainImageName);

        if (!image.exists()) {
            path.mkdirs();
            imageVO.getUploadImg().transferTo(image);
            imageVO.getContentImg().transferTo(contentImage);
            Thumbnails.of(image).size(300, 300).toFile(thumbnail);
        }

        productVO.setProductImgPath(contextPath.toString());
        productVO.setProductImg(image.toString().replace(path.toString(), ""));
        productVO.setProductThumbnail(thumbnail.toString().replace(path.toString(), ""));
        productVO.setProductContent(contentImage.toString().replace(path.toString(), ""));
        stockVO.setStockProductCode(productVO.getProductCode());
        product.saveFile(productVO);
        product.saveStock(stockVO);
    }

    public void modifyProduct(HttpServletRequest request, ProductModifyDTO productDTO) throws IllegalStateException, IOException {
        log.info("수정 메소드 실행 ---------------------------------------");
        ProductVO productVO = new ProductVO();
        productVO.setProductCode(productDTO.getProductCode());
        productVO.setProductName(productDTO.getProductName());
        productVO.setProductBrand(productDTO.getProductBrand());
        productVO.setProductPrice(productDTO.getProductPrice());
        productVO.setProductType(productDTO.getProductType());
        productVO.setProductContent(productDTO.getProductContent());

        if (!(productDTO.getUploadImg() == null)) {
            //이미지 파일 업로드
            log.info("업로드 dto 실행 ---------------------------------------");
            String fileName = UUID.randomUUID().toString() + "_" + productDTO.getUploadImg().getOriginalFilename();
            File path = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/product")));
            File contextPath = new File(getFolderPath(request.getSession().getServletContext().getContextPath() + "/resources/product"));
            File image = new File(path + "\\" + fileName);
            File thumbnail = new File(path + "\\S_" + fileName);

            if (!image.exists()) {
                path.mkdirs();
                productDTO.getUploadImg().transferTo(image);
                Thumbnails.of(image).size(300, 300).outputFormat("png").toFile(thumbnail);
            }

            productVO.setProductImgPath(contextPath.toString());
            productVO.setProductImg(image.toString().replace(path.toString(), ""));
            productVO.setProductThumbnail(thumbnail.toString().replace(path.toString(), ""));

        } else {
            //파일값이 null일시 히든값 받아서 실행
            log.info("널메소드 실행 ---------------------------------------");
            productVO.setProductImgPath(productDTO.getProductImgPath());
            productVO.setProductImg(productDTO.getProductImg());
            productVO.setProductThumbnail(productDTO.getProductThumbnail());
        }

        if (!(productDTO.getContentImg() == null)) {
            log.info("컨텐츠파일메소드 실행 ---------------------------------------");
            //컨텐츠파일 업로드
            String contentImgName = UUID.randomUUID().toString() + "_" + productDTO.getContentImg().getOriginalFilename();
            File contentImgpath = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/product/content")));
            File contentImgContextPath = new File(getFolderPath(request.getSession().getServletContext().getContextPath() + "/resources/product/content"));
            File contentImgimage = new File(contentImgpath + "\\" + contentImgName);


            if (!contentImgimage.exists()) {
                contentImgpath.mkdirs();
                productDTO.getContentImg().transferTo(contentImgimage);
            }

//            productVO.setProductContentImgpath(contentImgContextPath.toString());
//            productVO.setProductContentImg(contentImgimage.toString().replace(contentImgpath.toString(), ""));

        } else {
            //파일값이 null일시 히든값 받아서 실행
            log.info("콘텐츠 널메소드 실행 ---------------------------------------");
//            productVO.setProductContentImgpath(productDTO.getProductContentImgpath());
//            productVO.setProductContentImg(productDTO.getProductContentImg());
        }

        product.modifyFile(productVO);

        StockVO stockVO = new StockVO();
        stockVO.setStockProductCode(productDTO.getProductCode());
        stockVO.setStock240(productDTO.getStock240());
        stockVO.setStock245(productDTO.getStock245());
        stockVO.setStock250(productDTO.getStock250());
        stockVO.setStock255(productDTO.getStock255());
        stockVO.setStock260(productDTO.getStock260());
        stockVO.setStock265(productDTO.getStock265());
        stockVO.setStock270(productDTO.getStock270());
        stockVO.setStock275(productDTO.getStock275());
        stockVO.setStock280(productDTO.getStock280());
        stockVO.setStock285(productDTO.getStock285());
        stockVO.setStock290(productDTO.getStock290());
        stockVO.setStock295(productDTO.getStock295());
        product.modifyStock(stockVO);
    }
}
