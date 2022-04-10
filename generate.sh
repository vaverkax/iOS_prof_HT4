BEER_API_MODULE_SRC="Modules/NetworkingModule/Sources/NetworkingModule"

openapi-generator generate -i "networkingSpec.yaml" -g swift5 -o "api-mobile" --additional-properties hashableModels=false
rm -r $BEER_API_MODULE_SRC""*
cp -R "api-mobile/OpenAPIClient/Classes/OpenAPIs/". $BEER_API_MODULE_SRC
rm -r "api-mobile"

find $BEER_API_MODULE_SRC -path "*/APIs/*API.swift" |
while read i
    do sed -i "" -e "s/?.encodeToJSON(),/,/g" $i
       sed -i "" -e "s/.encodeToJSON(),/,/g" $i
done
