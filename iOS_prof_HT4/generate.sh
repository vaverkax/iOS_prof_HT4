BEER_API_MODULE_SRC="Modules/BeerApiNetworkModule/Sources/BeerApiNetworkModule"

openapi-generator generate -i "beerApi.yaml" -g swift5 -o "api-mobile" --additional-properies hashableModels=false
rm -r $BEER_API_MODULE_SRC""*
cp -R "api-mobile/OpenAPIClient/Classes/OpenAPIs". $BEER_API_MODULE_SRC
rm -r "api-mobile"
